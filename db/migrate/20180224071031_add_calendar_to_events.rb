class AddCalendarToEvents < ActiveRecord::Migration[5.1]
  def change
  	add_reference :events, :calendar, index: true
  end
end
