class Task < ApplicationRecord
  belongs_to :user
  belongs_to :project

  validates :item, presence: true
  validates :price, presence: true
  
  scope :by_item, -> { order(item: :asc) }
  
end
