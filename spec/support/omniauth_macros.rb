# in spec/support/omniauth_macros.rb

module OmniauthMacros
  def createAutoHash (provider = "facebook")
    OmniAuth::AuthHash.new({
         provider: provider,
         uid: '123545',
         info: {
             first_name: "Gaius",
             last_name:  "Baltar",
             email:      "test@example.com",
             image_url:  "image.com"
         },
         credentials: {
             token: "123456",
             expires_at: Time.now + 1.week
         },
         extra: {
             raw_info: {
                 gender: 'male'
             }
         }
     })
  end
  def silence_omniauth
    previous_logger = OmniAuth.config.logger
    OmniAuth.config.logger = Logger.new("/dev/null")
    yield
  ensure
    OmniAuth.config.logger = previous_logger
  end

end