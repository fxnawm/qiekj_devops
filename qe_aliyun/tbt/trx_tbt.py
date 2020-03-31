import urllib.request
import json

url='https://apilist.tronscan.org/api/token_trc20/holders?sort=-balance&start=%s&limit=40&contract_address=TDuetDuG2FTG6TqbpjRTApn5LpsQANFaBm'

n = 0
while n <= 2215:

    page = urllib.request.urlopen(url % n)
    htmlcode = page.read().decode('utf-8')
    data = json.loads(htmlcode)
    data = data['trc20_tokens']


    with open('tbt.txt', 'a+', encoding='utf-8') as f:
        for i in data:
            i = str(i).replace("'",'"')
            f.write(str(i)+'\n')
    n += 40