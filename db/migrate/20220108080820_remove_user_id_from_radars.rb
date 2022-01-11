class RemoveUserIdFromRadars < ActiveRecord::Migration[6.0]
  def change
    remove_column :radars, :user_id, :integer
  end
end
