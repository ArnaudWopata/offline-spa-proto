GrpServer::Application.config.secret_token = %w(development test).include?(Rails.env) ? 'x' * 30 : ENV['SECRET_TOKEN']
