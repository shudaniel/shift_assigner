json.extract! shift, :title, :id, :description, :max_employees, :weekdays, :assigned_to
json.title shift.title
json.start Shift.format_time_24hour(shift.start_time)
json.end shift.format_endtime
json.dow shift.weekdays
json.url shift_path(shift, calendar_id: params[:calendar_id], format: :html)