require 'pp'

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    generic_callback('Facebook')
  end


  def google_oauth2
    generic_callback('Google')
  end

  def twitter
    generic_callback('Twitter')
  end

  def instagram
    generic_callback('Instagram')
  end

  def generic_callback( provider )
    @user=User.from_omniauth(request.env["omniauth.auth"])
    if @user.persisted?
      #sign_in_and_redirect @user, :event => :authentication #this will throw
      # if @user is not activated
      redirect_to root_path
      set_flash_message(:notice, :success, :kind => "#{provider}") if
          is_navigational_format?
    else
      redirect_to root_path
      set_flash_message(:alert, :failure ,:kind => "#{provider}", :reason =>"invalid information") if
          is_navigational_format?
      #session["devise.data"] = request.env["omniauth.auth"]

    end
  end

  def failure
    redirect_to root_path
    set_flash_message(:alert, :failure ,:kind => env['omniauth.params'], :reason =>"invalid information") if
        is_navigational_format?
  end
end