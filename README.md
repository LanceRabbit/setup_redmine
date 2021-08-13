# Redmine

use docker-compose to combine redmine sql and nginx

## Redmine setup

建立基本設定參數, 執行以下 rake

```shell
RAILS_ENV=production REDMINE_LANG=zh-TW bundle exec rake redmine:load_default_data
```

## Dokcer Network issue

隨機產生的 ip 要確認是否會影響到實體 ip

遇到隨機產生 ip, 開頭 172.25.0.0 衝突到, 其他單位的ip 開頭是 172.&.*.* 無法連線到這台機器

要研究一下怎麼設定 network.
```
  docker network inspect [container_id][container_name]
```

```
# linux 確認 ip

route -n

```

## Nginx

### SSL for localhost

```shell
# 建立伺服器私鑰
openssl genrsa -out redmine.key 2048

# 建立證書簽名請求（CSR）
openssl req -new -key redmine.key -out redmine.csr

# 使用私鑰和CSR簽署證書
# -days 是證書期限365為365天有效
openssl x509 -req -days 365 -in redmine.csr -signkey redmine.key -out redmine.crt

# 加強服務器安全性
openssl dhparam -out dhparam.pem 2048

```
## Plugins

先確認 `data/redmine/plugins` 路徑已經存在

```shell
cp plugins/easy_gantt.zip data/redmine/plugins

cd data/redmine/plugins

unzip data/redmine/plugins/easy_gantt.zip

rm data/redmine/plugins/easy_gantt.zip
```

進入 redmine 環境，執行以下指令．

```shell
bundle exec rake redmine:plugins:migrate NAME=easy_gantt VERSION=0 RAILS_ENV=production
```