class User < ApplicationRecord
  has_many :tasks
  has_many :projects, through: :tasks 
   

    validates :username, presence: true, uniqueness: true
    validates :email, presence: true, uniqueness: true
    
    has_secure_password

  
    # def self.create_by_google_omniauth(auth)
    #     self.find_or_create_by(username: auth[:info][:email]) do |u|
    #       u.password = SecureRandom.hex
    #     end
    # end

    def self.from_omniauth(auth)
      User.find_or_create_by(uid: auth[:uid]) do |u|
          u.username = auth[:info][:name]
          u.email = auth[:info][:email]
          u.password = SecureRandom.hex(8)
      end
    end
  
end
