class AddColumnHostIdToRadars < ActiveRecord::Migration[6.0]
  def change
    add_column :radars, :host_id, :integer
  end
end
