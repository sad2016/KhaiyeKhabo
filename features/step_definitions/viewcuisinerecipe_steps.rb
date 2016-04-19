Then(/^I should see a link for a cuisine$/) do
  expect(page).to have_css('a', @cuisine.name)
end

When(/^I click on a cuisine$/) do
  find_link("Indian Cuisine", href: searchcuisine_recipes_path(:searchcuisine=>@cuisine.id)).click
end
