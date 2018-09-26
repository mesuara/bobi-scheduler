json.extract! appointment, :id, :title, :description, :start_time, :end_time, :user_id, :field_id, :created_at, :updated_at
json.url appointment_url(appointment, format: :json)
