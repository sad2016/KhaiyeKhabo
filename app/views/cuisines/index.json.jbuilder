json.array!(@cuisines) do |cuisine|
  json.extract! cuisine, :id, :name
  json.url cuisine_url(cuisine, format: :json)
end
