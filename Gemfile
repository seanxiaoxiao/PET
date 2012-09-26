source 'https://rubygems.org'

gem 'rails'
gem 'haml-rails'
gem 'jquery-rails'
gem 'bootstrap-sass-rails'

# Used to generate sample data
gem 'factory_girl_rails'
gem "faker", '= 1.0.1' #Specific version required for heroku

gem 'heroku'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails', '3.2.5'
  gem 'coffee-rails'
  gem 'uglifier'
end

group :development, :test do
  gem 'sqlite3', '1.3.5'
  #Used to annotate models with the database schema
  gem 'annotate'

  #Gems for testing
  gem 'rspec-rails'
  gem 'spork-rails'
  gem 'guard-rspec'
  gem 'guard-spork'
  #Guard dependency
  gem 'rb-fsevent'
  gem 'growl'
end

group :test do
  gem 'capybara'
  gem 'launchy'
end

group :production do
  gem 'pg', '0.12.2'
end