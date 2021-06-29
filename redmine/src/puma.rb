# config/puma.rb
#!/usr/bin/env puma
# TODO: 待測試, 目前使用 passenger

directory '/usr/src/redmine/app/' # 替換為自己 Application 的 Working Directory
rackup "/usr/src/redmine/app/config.ru"
environment ENV['RAILS_ENV'] || 'development'

workers Integer(ENV['WEB_CONCURRENCY'] || 2)
threads_count = Integer(ENV['RAILS_MAX_THREADS'] || 5)
threads threads_count, threads_count

preload_app!

on_worker_boot do
  ActiveSupport.on_load(:active_record) do
    ActiveRecord::Base.establish_connection
  end
end