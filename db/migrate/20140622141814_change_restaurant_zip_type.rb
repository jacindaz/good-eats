class ChangeRestaurantZipType < ActiveRecord::Migration
  def up
   change_column :restaurants, :zipcode, :string
  end

  def down
   change_column :restaurants, :zipcode, :integer
  end
end
