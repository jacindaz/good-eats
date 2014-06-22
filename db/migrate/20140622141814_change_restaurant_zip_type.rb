class ChangeRestaurantZipType < ActiveRecord::Migration
  def change
   change_column :restaurants, :zipcode, :string
  end
end
