json.extract! reservation, :id, :from, :to, :team_name, :created_at, :updated_at
json.url reservation_url(reservation, format: :json)
