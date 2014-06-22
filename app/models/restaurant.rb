class Restaurant < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  validates :address, presence: true, uniqueness: { scope: :city }
  validates :city, presence: true
  validates :state, presence: true, length: 2
  validates :zipcode, presence: true, length: 5

  has_many :reviews
end
