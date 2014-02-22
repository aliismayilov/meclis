Jumpup::Heroku.configure do |config|
  config.app = 'meclis'
end if Rails.env.development?