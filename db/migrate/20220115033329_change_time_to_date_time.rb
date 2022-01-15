class ChangeTimeToDateTime < ActiveRecord::Migration[6.0]
  def change
    remove_column :radars, :time
    add_column :radars, :time, :datetime
  end
end
