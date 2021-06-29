# Redmine

use docker-compose to combine redmine sql and nginx


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