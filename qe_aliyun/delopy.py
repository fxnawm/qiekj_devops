#!/usr/bin/env python
# coding=utf-8

# 示例执行异常时建议升级aliyun-python-sdk-core到最新版本
from aliyunsdkcore.acs_exception.exceptions import ClientException
from aliyunsdkcore.acs_exception.exceptions import ServerException
from aliyunsdkcore.client import AcsClient
from aliyunsdkcr.request.v20160607 import GetRepoTagsRequest
from aliyunsdkcore.request import CommonRequest
from operator import itemgetter
import jsonpath, json
import sys, time


class Alisdk:
    def __init__(self):
        self.apiClient = AcsClient('***', '***', 'cn-shanghai')
        self.request = CommonRequest()
        self.body = ''''''
        self.request.set_accept_format('json')
        # self.request.set_method('POST')
        self.request.set_protocol_type('https')
        self.request.set_domain('edas.cn-shanghai.aliyuncs.com')
        self.request.set_version('2017-08-01')
        self.request.add_query_param('RegionId', 'cn-shanghai')
        self.request.set_content(self.body)

    def Get_image(self, reponame):

        # 设置参数
        request = GetRepoTagsRequest.GetRepoTagsRequest()
        request.set_RepoNamespace("qiekj")
        request.set_RepoName('{}'.format(reponame))
        request.set_endpoint("cr.cn-shanghai.aliyuncs.com")

        # 发起请求
        try:
            response = self.apiClient.do_action_with_exception(request)
            data = response.decode('utf-8')
            tag_info = jsonpath.jsonpath(json.loads(data), expr="$..tags")[0]
            sorted_update = sorted(tag_info, key=itemgetter('imageUpdate'), reverse=True)
            return sorted_update[0].get('tag')
        except ServerException as e:
            print(e)
        except ClientException as e:
            print(e)

    def Get_Appid(self, project):
        # body = ''''''
        self.request.set_method('POST')
        self.request.set_uri_pattern('/pop/v5/app/app_list')
        response = self.apiClient.do_action_with_exception(self.request)
        data = response.decode('utf-8')
        appid = jsonpath.jsonpath(json.loads(data),
                                  expr="$.ApplicationList.Application[?(@.Name=='{}')].AppId".format(project))[0]
        return appid

    def change_order_info(self, changeorderid, latest_version):
        self.request.set_method('POST')
        self.request.add_query_param('ChangeOrderId', changeorderid)
        self.request.set_uri_pattern('/pop/v5/changeorder/change_order_info')
        time.sleep(20)
        # body = ''''''
        while True:
            response = self.apiClient.do_action(self.request)
            data = response.decode('utf-8')
            is_success = jsonpath.jsonpath(json.loads(data),
                                           expr="$..StageInfoDTO[?(@.StageName=='Process Complete' && @.StageResultDTO.ServiceStage.Message=='Success')]")
            if is_success:
                break
            else:
                print("readiness检查失败，等待下一次检测.....")
                sys.stdout.flush()
            time.sleep(10)
        print('本次发布成功，发布版本为{},请确认！'.format(latest_version))
        return True

    def CheckTimeout(self, appid):
        self.request.set_method('GET')
        self.request.set_uri_pattern('/pop/v5/k8s/pop/pop_serverless_app_config_detail')
        self.request.add_query_param('AppId', appid)
        response = self.apiClient.do_action_with_exception(self.request)
        data = response.decode('utf-8')
        data = jsonpath.jsonpath(json.loads(data), expr="$..Readiness")[0]
        second = json.loads(data).get('timeoutSeconds')
        return second

    def deploy(self, appid, latest_version, reponame, second):
        self.request.set_method('POST')
        self.request.add_query_param('AppId', '{}'.format(appid))
        self.request.add_query_param('ImageTag', '{}'.format(latest_version))
        self.request.add_query_param('Readiness',
                                     '{"failureThreshold": 5,"initialDelaySeconds": 20,"successThreshold": 1,"timeoutSeconds": %s,"TcpSocket": {"port": 8080}}' % (
                                         3 if int(second) == 2 else 2))
        self.request.add_query_param('Liveness',
                                     '{"failureThreshold": 5,"initialDelaySeconds": 30,"successThreshold": 1,"timeoutSeconds": 3,"tcpSocket":{"host":"", "port":8080}}')
        self.request.add_query_param('Replicas', '1')
        self.request.add_query_param('Image',
                                     'registry.cn-shanghai.aliyuncs.com/qiekj/{}:{}'.format(reponame, latest_version))
        self.request.add_query_param('Envs',
                                     '[{"name":"ACM_GROUP","value":"08964865-1c4f-4e6a-8dc1-a174e83645ad"},{"name":"SPRING_PROFILES_ACTIVE","value":"pre"},{"name":"HTTP_PORT","value":"8080"}]')
        self.request.set_uri_pattern('/pop/v5/k8s/acs/k8s_apps')
        # body = ''''''

        response = self.apiClient.do_action(self.request)

        change_order_id = json.loads(response.decode('utf-8')).get('ChangeOrderId')
        # print(change_order_id)
        self.change_order_info(change_order_id, latest_version)


if __name__ == '__main__':
    # 定义预发布应用名称和镜像仓库名称的对应关系
    relation = {"pre-userapi": "qiekj-user-api",
                "pre-imsapi": "qiekj-ims",
                "pre-machine": "machine",
                "pre-merchantapi": "qiekj-merchant-api",
                "pre-miscapi": "misc",
                "pre-task": "qiekj-task",
                "pre-iotreport": "iot-report",
                "pre-vindapi": "qiekj-vindicate"}

    project = sys.argv[1]
    req = Alisdk()
    appid = req.Get_Appid(project)
    reponame = relation.get(project)
    latest_version = req.Get_image(reponame)
    second = req.CheckTimeout(appid)
    print(appid, reponame, latest_version, second)
    req.deploy(appid, latest_version, reponame, second)