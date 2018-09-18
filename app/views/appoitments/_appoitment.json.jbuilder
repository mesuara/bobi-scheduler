json.extract! appoitment, :id, :description, :start_time, :end_time, :user_id, :field_id, :created_at, :updated_at
json.url appoitment_url(appoitment, format: :json)
