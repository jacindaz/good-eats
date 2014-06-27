class Review < ActiveRecord::Base
  validates :rating,
    presence: true,
    # numericality: { greater_than: 0, less_than: 6 }
    inclusion: { within: 1..5 }
  validates :body,
    presence: true,
    length: { minimum: 140, maximum: 500 }
  validates :restaurant, presence: true

  belongs_to :restaurant
end
