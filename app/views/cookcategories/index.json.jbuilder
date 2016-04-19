json.array!(@cookcategories) do |cookcategory|
  json.extract! cookcategory, :id, :name
  json.url cookcategory_url(cookcategory, format: :json)
end
