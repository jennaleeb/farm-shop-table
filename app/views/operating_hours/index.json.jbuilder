json.array!(@operating_hours) do |operating_hour|
  json.extract! operating_hour, :id, :day_of_week, :start_time, :end_time, :is_weekend_hours, :shop_id
  json.url operating_hour_url(operating_hour, format: :json)
end