class RenameEventsToShifts < ActiveRecord::Migration[5.1]
  def change
    rename_table :events, :shifts
  end
end
