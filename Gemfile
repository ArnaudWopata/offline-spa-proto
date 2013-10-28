source 'https://rubygems.org'
ruby '2.0.0'

gem 'rack-cors', require: 'rack/cors'
gem 'rails', '3.2.14'
gem 'rails-i18n', '~> 3.0.0'
gem 'unicorn', '~> 4.6.3'
gem 'pg', '~> 0.16.0'
gem 'delayed_job_active_record', '~> 4.0.0'
gem 'devise', '~> 3.0.2'
gem 'devise_invitable', '~> 1.2.1'
gem 'cancan', '~> 1.6.10'
gem 'omniauth-google-oauth2', '~> 0.2.0'
gem 'rails_12factor', group: :production # Heroku requirement
gem 'draper', '~> 1.2.1'

gem 'carrierwave', '~> 0.9.0'
gem 'carrierwave_backgrounder', '~> 0.3.0'
gem 'rmagick', '~> 2.13.2'
gem 'fog', '~> 1.15.0'
gem 'rack-offline'

gem 'rabl', '~> 0.8.6'
gem 'haml-rails', '~> 0.4'
gem 'inherited_resources'
gem 'compass-rails'
gem 'jquery-rails'
gem 'underscore-rails'
gem 'wicked_pdf', '~> 0.9.7'
gem 'redcarpet', '~> 3.0.0'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails', '~> 3.2.6'

  # JS replacement
  gem 'coffee-rails', '~> 3.2.2'

  # JS interpreter
  gem 'therubyracer', '~> 0.11.3',  platform: :ruby
  gem 'therubyrhino', '~> 2.0.2',   platform: :jruby

  # Misc
  gem 'uglifier', '~> 1.3.0'    # wrapper for UglifyJS JavaScript compressor
end

group :development do
  gem 'mailcatcher'
  gem 'rspec-rails'
  gem 'foreman'
  gem 'annotate'
  gem 'pry-rails'
  gem 'sextant'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'quiet_assets'
  gem 'guard-livereload'
end

group :test do
  gem 'rspec-rails'
  gem 'guard'
  gem 'guard-rspec'
  gem 'shoulda-matchers'
  gem 'factory_girl'
  gem 'database_cleaner'
  gem 'faker'
  gem 'growl'
end
