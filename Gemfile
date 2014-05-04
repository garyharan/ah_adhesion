source 'https://rubygems.org'
ruby "2.1.1" # https://devcenter.heroku.com/changelog-items/428

gem 'rails',                        '4.1.0'
gem 'pg'
gem 'state_machine',                '~> 1.2'

# Authentication
gem 'devise'

# views
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'sass-rails', '~> 4.0.3'
gem 'slim-rails'
gem 'jquery-rails'
gem 'turbolinks'
gem 'bootstrap-sass'

gem 's3_direct_upload'
gem 'activeadmin', github: 'gregbell/active_admin'
# gem "meta_search"

gem 'spring',        group: :development

group :development, :test do
  gem 'foreman'
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'faker'
  gem 'pry-rails'
  gem 'pry-remote'
  gem 'capybara'
end

group :production do
  gem 'rails_12factor'
end
