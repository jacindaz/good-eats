class Review < ActiveRecord::Base
  validates :rating, presence: true, length: 1, numericality: { greater_than: 0, less_than: 6 }
  validates :body, presence: true, length: { in: 140..500 }
  validates :restaurant_id, presence: true

  belongs_to :restaurant
end
