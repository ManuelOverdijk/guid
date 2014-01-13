class User < ActiveRecord::Base
  
  has_secure_password
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: {with: VALID_EMAIL_REGEX},
  									uniqueness: true
  before_create :create_activation_code
  after_create :send_confirmation_email
  has_many :tokens
  
  def send_confirmation_email
    UserMailer.confirmation_email(self).deliver
  end
  
  def create_activation_code
    self.activation_code = random_string(length=10)
  end
  
  def random_string(length=10)
    (1..length).collect {alphanumeric_characters.sample}.join
  end
  
  def alphanumeric_characters
    ("a".."z").to_a + ("0".."9").to_a
  end

  def is_active?
    self.activation_code == nil
  end
      
end
