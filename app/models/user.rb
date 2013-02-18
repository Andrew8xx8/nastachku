require 'digest/md5'

class User < ActiveRecord::Base
  include UserRepository

  has_many :authorizations

  attr_accessible :email,   :password,
                  :first_name, :last_name, :city,
                  :company, :position,
                  :show_as_participant, :photo, :state_event, :about

  validates :email, presence: true, uniqueness: true, email: true
  validates :city, presence: true
  validates :first_name, length: {maximum: 20}
  validates :last_name, length: {maximum: 20}
  validates :city, length: {maximum: 20}
  validates :company, length: {maximum: 20}
  validates :position, length: {maximum: 20}
  
  mount_uploader :photo, UsersPhotoUploader 

  has_many :auth_tokens

  state_machine :state, initial: :active do
    state :active
    state :inactive

    event :activate do
      transition any - :active => :active
    end

    event :deactivate do
      transition :active => :inactive
    end
  end


  def create_auth_token
    token = SecureHelper.generate_token
    expired_at = Time.current + configus.token.lifetime
    auth_tokens.create! :authentication_token => token, :expired_at => expired_at
  end

  def full_name
    "#{last_name} #{first_name}"
  end

  def to_s
    full_name
  end

  def authenticate(password)
    self.password_digest == Digest::MD5.hexdigest(password)
  end

  def password=(password)
    @real_password = password
    self.password_digest = Digest::MD5.hexdigest(password)
  end

  def password
    @real_password
  end

end
