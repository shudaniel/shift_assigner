class ChangeStartEndTimeFromDatetimeToTime < ActiveRecord::Migration[5.1]
  def change
    change_column :shifts, :start_time, :time
    change_column :shifts, :end_time, :time
  end
end
