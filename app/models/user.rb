class User < ApplicationRecord
    has_many :projects
    has_many :tasks
    has_many :tasked_projects, through: :tasks

    validates :username, presence: true, uniqueness: true
    validates :email, presence: true, uniqueness: true
    
    has_secure_password

    def self.create_by_google_omniauth(auth)
        self.find_or_create_by(username: auth[:info][:email]) do |u|
          u.password = SecureRandom.hex
        end
    end
  
end
