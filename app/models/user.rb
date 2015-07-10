class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :recoverable, :validatable

  after_create :update_access_token

  # Association
  has_many :events

  validates :username, presence: true
  validates :email, presence: true

private

  def update_access_token
    self.access_token = generate_access_token
    save
  end

  def generate_access_token
    loop do
      token =  "#{self.id}:#{Devise.friendly_token}"
      break token unless User.where(access_token: token).first
    end
  end

end
