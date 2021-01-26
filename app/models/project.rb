class Project < ApplicationRecord
    has_many :tasks
    has_many :users, through: :tasks
    accepts_nested_attributes_for :tasks

    validates :name, presence: true, uniqueness: true
    validates :contractor, presence: true, uniqueness: true
    validates :description, presence: true
    validates :date, presence: true

   

end