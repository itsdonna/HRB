class Project < ApplicationRecord
    has_many :tasks
    has_many :users, through: :tasks
    accepts_nested_attributes_for :tasks
end
