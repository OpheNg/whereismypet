class AddCityToPets < ActiveRecord::Migration[6.1]
  def change
    add_column :pets, :city, :string
  end
end
