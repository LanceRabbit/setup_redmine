FROM nginx:1.21
COPY ./conf/default.conf /etc/nginx/conf.d/default.conf
COPY ./ssl/redmine.crt /etc/nginx/redmine.crt
COPY ./ssl/redmine.key /etc/nginx/redmine.key
COPY ./ssl/dhparam.pem /etc/nginx/dhparam.pem