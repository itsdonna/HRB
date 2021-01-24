class Task < ApplicationRecord
  belongs_to :user
  belongs_to :project

  validates :item, presence: true
  validates :price, presence: true
  
  accepts_nested_attributes_for :project
end
