json.extract! shift, :id, :description, :max_employees, :assigned_to
json.title shift.description
json.start shift.start_time
json.end shift.end_time
json.url shift_path(shift, calendar_id: params[:calendar_id], format: :html)