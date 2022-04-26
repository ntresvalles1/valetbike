class User < ApplicationRecord  
  has_secure_password
  validates_presence_of  :username,
                         :email,
                         :password,
                         :first_name,
                         :last_name

validates_uniqueness_of :username, inclusion:{message: "Username taken. Please choose another."}
validates_uniqueness_of :email, inclusion:{message: "Email taken. Please choose another."}
has_many :rides, class_name: :Ride, foreign_key: :rider_user_id
belongs_to :current_membership, class_name: :Membership, foreign_key: :membershipID, optional: true
  
  attr_accessor :remember_token, :activation_token, :reset_token
  before_save   :downcase_email
  before_create :create_activation_digest
  validates :username,  presence: true, length: { maximum: 50 }

  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                    BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
    end
  
  
  def User.new_token
    SecureRandom.urlsafe_base64
  end
  
  #returns true when token matches digest
  def authenticated?(attribute, token)
    digest = send("#{attribute}_digest")
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password?(token)
  end
  
  def activate
    update_attribute(:activated,    true)
    update_attribute(:activated_at, Time.zone.now)
  end
  
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end
  
  # Sets the password reset attributes.
  def create_reset_digest
    self.reset_token = User.new_token
    update_attribute(:reset_digest,  User.digest(reset_token))
    update_attribute(:reset_sent_at, Time.zone.now)
  end
  
  
  # Sends password reset email.
  def send_password_reset_email
    UserMailer.password_reset(self).deliver_now
  end
  
  # Returns true if a password reset has expired.
  def password_reset_expired?
    reset_sent_at < 2.hours.ago
  end

  private
    def downcase_email
      self.email.downcase!
    end

    def create_activation_digest
      self.activation_token  = User.new_token
      self.activation_digest = User.digest(activation_token)
    end
    
    
end
