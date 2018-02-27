json.extract! shift, :id, :title, :description
json.start shift.start_time
json.end shift.end_time
json.url shift_path(shift, calendar_id: params[:calendar_id], format: :html)