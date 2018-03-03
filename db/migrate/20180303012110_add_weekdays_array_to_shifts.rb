class AddWeekdaysArrayToShifts < ActiveRecord::Migration[5.1]
  def change
    add_column :shifts, :weekdays, :integer, array: true, default: []
  end
end
