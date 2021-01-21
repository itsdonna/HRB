class User < ApplicationRecord
    has_many :tasks
    has_many :projects, through: :tasks

    has_secure_password

    validates :username, presence: true, uniqueness: true
    validates :email, presence: true, uniqueness: true
end
