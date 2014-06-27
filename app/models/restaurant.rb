require_relative 'states'

class Restaurant < ActiveRecord::Base
  # STATES = ["AK", "AL", etc.]

  validates :name,
    presence: true,
    uniqueness: true
  validates :address,
    presence: true,
    uniqueness: { scope: :city }
  validates :city,
    presence: true
  validates :state,
    presence: true,
    # length: true,
    inclusion: { in: States.new.state_abbrevs }
  validates :zipcode,
    presence: true,
    length: { in: 5..10 }

  has_many :reviews
end
