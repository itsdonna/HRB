class Task < ApplicationRecord
  belongs_to :user
  belongs_to :project

  scope :alpha, -> { order(:price)} 

  validates :item, presence: true
  validates :price, presence: true
  
  
  
end
