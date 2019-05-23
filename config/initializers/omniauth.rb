
Rails.application.config.middleware.use OmniAuth::Builder do
  # provider :facebook, YOUR_APP_ID, YOUR_APP_SECRET
  provider :google, ENV['GOOGLE_CLIENT_ID'], ENV['GOOGLE_SECRET_KEY']
end
