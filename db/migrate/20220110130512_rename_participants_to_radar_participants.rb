class RenameParticipantsToRadarParticipants < ActiveRecord::Migration[6.0]
  def change
    rename_table :participants, :radar_participants
  end
end
