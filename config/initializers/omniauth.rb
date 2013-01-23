Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, 'YOUR_CONSUMER_KEY', 'YOUR_CONSUMER_SECRET'
end
