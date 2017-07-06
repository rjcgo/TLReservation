json.extract! reservation, :id, :from, :to, :team_name, :tl_id, :created_at, :updated_at
json.url reservation_url(reservation, format: :json)
