FROM redmine:4.2.1-passenger

COPY ./src/base.html.erb /usr/src/redmine/app/views/layouts/
COPY ./src/futures-logo.png /usr/src/redmine/public/images/
COPY ./src/configuration.yml /usr/src/redmine/config/

USER redmine
