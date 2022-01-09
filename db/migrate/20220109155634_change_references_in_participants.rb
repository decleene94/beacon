class ChangeReferencesInParticipants < ActiveRecord::Migration[6.0]
  def change
    remove_reference :participants, :radar, index: true
    remove_reference :participants, :user, index: true
  end
end
