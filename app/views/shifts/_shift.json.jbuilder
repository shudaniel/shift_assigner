json.extract! shift, :id, :title, :description
json.start shift.start_time
json.end shift.end_time
json.url shift_url(shift, format: :html)