source 'https://rubygems.org'
ruby '2.1.0'

gem 'rails',                  '=  4.0.3'
gem 'puma',                   '~> 2.7.1'
gem 'secure_headers',         '~> 1.1.1'
gem 'jquery-rails',           '~> 3.1.0'
gem 'turbolinks',             '~> 2.2.1'
gem 'jbuilder',               '~> 2.0.3'
gem 'haml'
gem 'pg'
gem 'sass-rails',             '~> 4.0.1'
gem 'coffee-rails',           '~> 4.0.1'
gem 'uglifier',               '~> 2.4.0'
gem 'rack-canonical-host',    '~> 0.0.8'
gem 'rack-timeout',           '~> 0.0.4'
gem 'bourbon',                '~> 3.1.8'

group :production do
  gem 'rails_12factor'
  gem 'rollbar'
end

group :development do
  gem 'foreman',              '~> 0.63.0'
  gem 'jumpup',               '=  0.0.3'
  gem 'jumpup-heroku',        '=  0.0.3'
  gem 'better_errors',        '~> 1.1.0'
  gem 'binding_of_caller',    '~> 0.7.2'
  gem 'letter_opener',        '~> 1.2.0'
end

group :test do
  gem 'shoulda-matchers',     '~> 2.5.0'
  gem 'simplecov',            '~> 0.8.2', require: false
  gem 'coveralls',                        require: false
  gem 'email_spec',           '~> 1.5.0'
  gem 'capybara',             '~> 2.2.1'
  gem 'poltergeist',          '~> 1.5.0'
  gem 'database_cleaner',     '~> 1.2.0'
end

group :development, :test do
  gem 'rspec-rails',          '~> 3.0.0.beta'
  gem 'rspec-its'
  gem 'factory_girl_rails',   '~> 4.4.0'
  gem 'pry-rails',            '~> 0.3.2'
  gem 'dotenv-rails',         '~> 0.9.0'
end

