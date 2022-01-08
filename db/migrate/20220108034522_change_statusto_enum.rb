class ChangeStatustoEnum < ActiveRecord::Migration[6.0]
  def change
      change_column :participants, :status, :integer, using: 'status::integer'
  end
end
