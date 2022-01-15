class AddAddressToRadars < ActiveRecord::Migration[6.0]
  def change
    add_column :radars, :address, :text
  end
end
