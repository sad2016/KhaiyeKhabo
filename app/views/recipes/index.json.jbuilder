json.array!(@recipes) do |recipe|
  json.extract! recipe, :id, :title, :description, :ingredients, :directions, :preptime, :cooktime, :servings, :cuisine_id, :cookcategory_id, :user_id, :picture
  json.url recipe_url(recipe, format: :json)
end
