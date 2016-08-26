class User < ApplicationRecord
  after_create :send_welcome_email_to_user
 # VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
 # validates :email, presence: true, length: { maximum: 255 },
  #          format: { with: VALID_EMAIL_REGEX }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  #devise :database_authenticatable, :registerable,
  #       :recoverable, :rememberable, :trackable, :validatable
  devise :database_authenticatable, :registerable, :validatable, :omniauthable, :omniauth_providers => [:facebook, :google_oauth2, :twitter, :instagram]

  after_create :subscribe_user_to_mailing_list

  #def self.new_with_session(params, session)
  #  super.tap do |user|
  #    if data = session["devise.facebook_data"] && session["devise
  # .facebook_data"]["extra"]["raw_info"]
  #      user.email = data["email"] if user.email.blank?
  #    end
  #  end
  #end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.name = auth.info.name
      user.image_url = auth.info.image
      #user.password = Devise.friendly_token[0,20]
    end
  end

  protected
  def password_required?
    false
  end

  private

  def send_welcome_email_to_user
    UserMailer.welcome_email(self).deliver_now
  end

  def subscribe_user_to_mailing_list
    SubscribeUserToMailingListJob.perform_later(self)
  end
end
