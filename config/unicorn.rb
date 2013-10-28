worker_processes 3
preload_app true
env_timeout = ENV['TIMEOUT'] ? ENV['TIMEOUT'].to_i : nil
timeout env_timeout || 30

before_fork do |srv,wrk|
  ActiveRecord::Base.connection.disconnect! if defined? ActiveRecord
end

after_fork do |srv,wrk|
  ActiveRecord::Base.establish_connection if defined? ActiveRecord
end
