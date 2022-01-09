class AddNewReferencesInParticipants < ActiveRecord::Migration[6.0]
  def change
    add_reference :participants, :radar_participant, foreign_key: { to_table: :users }, index: true, null: false
    add_reference :participants, :joined_radar, foreign_key: { to_table: :radars }, index: true, null: false
  end
end
