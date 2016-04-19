Then(/^I should type in the search for cuisine$/) do
  fill_in "Search in #{@cuisine.name} Cuisine", with: @recipe.title
  visit "/recipes/searchcuisine?searchcuisine=#{@cuisine.id}"
end
