insert into zzg_cwsj_je
SELECT
	CEILING( RAND( ) * 900000000000000+100000000000000 ) id,
	'联营' AS 'model',
	t.`name` AS 'shoptype',
	'饮水机' AS 'machinetype',
	'dateday' rq,
	round(sum(o.payprice)/10000,4) je 
FROM
	t_order o
	LEFT JOIN t_machine m ON o.machineid = m.machineid
	LEFT JOIN t_machine_type type ON m.parenttypeid = type.machinetypeid
	LEFT JOIN t_shop s ON m.shopid = s.shopid
	LEFT JOIN t_shoptype t ON s.shoptype = t.id
	LEFT JOIN t_operator p ON s.operatorid = p.id 
WHERE
	o.orderstatus = 2 
	AND o.createtime < 'createdate'
	AND t.NAME IN ( '流动人口社区', '工厂', '学校', '公寓' ) 
	AND type.machinetypename = '饮水机' 
	AND p.username='企鹅科技'
GROUP BY
	t.`name` UNION ALL
SELECT
	CEILING( RAND( ) * 900000000000000+100000000000000 ) id,
	'联营' AS 'model',
	'其他' AS `shoptype`,
	'饮水机' AS 'machinetype',
	'dateday' rq,
	round(sum(o.payprice)/10000,4) je
FROM
	t_order o
	LEFT JOIN t_machine m ON o.machineid = m.machineid
	LEFT JOIN t_machine_type type ON m.parenttypeid = type.machinetypeid
	LEFT JOIN t_shop s ON m.shopid = s.shopid
	LEFT JOIN t_shoptype t ON s.shoptype = t.id
	LEFT JOIN t_operator p ON s.operatorid = p.id 
WHERE
	o.orderstatus = 2 
	AND o.createtime < 'createdate'
	AND t.NAME NOT IN ( '流动人口社区', '工厂', '学校', '公寓' ) 
	AND type.machinetypename = '饮水机' 
	AND p.username='企鹅科技';