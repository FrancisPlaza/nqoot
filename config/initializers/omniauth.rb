OmniAuth.config.logger = Rails.logger

# Unique app identifier for Facebook
FACEBOOK_APP_ID = '376338149113883'
FACEBOOK_SECRET = '79cb1d1b593d42fd1170d4e9239d7497'

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, FACEBOOK_APP_ID, FACEBOOK_SECRET
end