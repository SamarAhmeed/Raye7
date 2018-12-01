json.extract! trip, :id, :user_id, :source_id, :destination_id, :time, :numberOfSeats, :created_at, :updated_at
json.url trip_url(trip, format: :json)
