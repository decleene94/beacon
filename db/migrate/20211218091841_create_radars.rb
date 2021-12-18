class CreateRadars < ActiveRecord::Migration[6.0]
  def change
    create_table :radars do |t|
      t.string :time
      t.integer :radius
      t.text :description
      t.references :user, null: false, foreign_key: true
      t.references :activity, null: false, foreign_key: true

      t.timestamps
    end
  end
end
