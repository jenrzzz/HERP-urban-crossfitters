Rails.application.config.middleware.use OmniAuth::Builder do
    provider :developer unless Rails.env.production?
    provider :facebook, APP_CONFIG['facebook']['app_id'], APP_CONFIG['facebook']['app_secret'],
        :scope => 'email,user_birthday,email,publish_stream'
end
