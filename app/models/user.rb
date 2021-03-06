class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :validatable, :confirmable, :timeoutable, :lockable

  after_create :send_email_welcome

  def send_email_welcome
    ShopMailer.new_user(self).deliver
  end

  def self.find_for_google_oauth2(provider, uid, name, email, signed_in_resource = nil)
    user = User.where(:provider => provider, :uid => uid).first

    if user
      user.skip_confirmation!
      user.skip_confirmation_notification!
      user.save
      return user
    else
      registered_user = User.where(:email => email).first
      if registered_user
        registered_user.skip_confirmation!
        registered_user.skip_confirmation_notification!
        registered_user.save
        return registered_user
      else
        user = User.new(
            name: name,
            provider: provider,
            email: email,
            uid: uid,
            password: Devise.friendly_token[0, 20]
        )
        user.skip_confirmation!
        user.skip_confirmation_notification!
        user.save
        return user
      end
    end
  end

  def self.find_for_facebook_oauth(provider, uid, name, email, signed_in_resource = nil)
    user = User.where(:provider => provider, :uid => uid).first

    if user
      user.skip_confirmation!
      user.skip_confirmation_notification!
      user.save
      return user
    else
      registered_user = User.where(:email => email).first
      if registered_user
        registered_user.skip_confirmation!
        registered_user.skip_confirmation_notification!
        registered_user.save
        return registered_user
      else
        user = User.new(
            name: name,
            provider: provider,
            email: email,
            uid: uid,
            password: Devise.friendly_token[0, 20]
        )
        user.skip_confirmation!
        user.skip_confirmation_notification!
        user.save
        return user
      end
    end
  end
end

