Rails.application.config.middleware.use OmniAuth::Builder do
    #provider :developer unless Rails.env.production?
    provider :facebook, ENV['293232480769280'], ENV['0b4329dfa2552caf5d25e449216fa9cb'],
        :scope => 'id,name,picture,gender,user_birthday,email,publish_stream',
        :display => 'touch'
end
