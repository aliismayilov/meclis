RSpec.configure do |config|
  config.before(:suite) do
    DatabaseCleaner.start
    FactoryGirl.lint
    DatabaseCleaner.clean
  end
end