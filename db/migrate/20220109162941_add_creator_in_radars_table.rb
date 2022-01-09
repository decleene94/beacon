class AddCreatorInRadarsTable < ActiveRecord::Migration[6.0]
  def change
    add_reference :radars, :creator, foreign_key: { to_table: :users}, index: true, null: false
  end
end
