json.extract! meetup, :id, :name, :latitude, :longitude, :created_at, :updated_at
json.url meetup_url(meetup, format: :json)
