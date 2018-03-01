json.extract! employee, :id, :name, :email, :employee_id, :calendar_id, :created_at, :updated_at
json.url employee_url(employee, format: :json)
