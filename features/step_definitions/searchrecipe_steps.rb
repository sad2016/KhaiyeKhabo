Then(/^I should see an option to search for recipes$/) do
  expect(page).to have_css('input', 'Search for Recipes')
end

Then(/^I should type in the search$/) do
  fill_in 'Search for Recipes', with: @recipe.title
  visit '/recipes/search'

end

Then(/^I should see a list of recipes with that name$/) do
  expect(page).to have_css('h4', @recipe.title)
end
