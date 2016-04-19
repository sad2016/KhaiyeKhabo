Then(/^I should see a link for My Recipes$/) do
  expect(page).to have_link('My Recipes', href: myrecipe_recipes_path)
end

When(/^I click on the My Recipes link$/) do
  find_link('My Recipes', href: myrecipe_recipes_path).click
end

Then(/^I should see a list of my Uploaded recipes$/) do
  expect(page).to have_css('ul', 'li')
end

When(/^I click on a recipe from the list$/) do
  find_link("View Recipe", href: recipe_path(@recipe.id)).click
end

Then(/^I should see my recipe$/) do
  expect(page).to have_css('p strong', 'Title')
end

Then(/^I should see a link for Edit Recipe$/) do
  expect(page).to have_link('Edit', href: edit_recipe_path(@recipe.id))
end

When(/^I click on the Edit Recipe link$/) do
  find_link('Edit', href: edit_recipe_path(@recipe.id)).click
end

Then(/^I should see an Edit Recipe form$/) do
  expect(page).to have_selector("form#edit_recipe_#{@recipe.id}")
end

When(/^I submit the Edit Recipe form$/) do
  fill_in 'Title', with: "Pani Puri"
  fill_in 'Description', with: "Golgappa"
  fill_in 'Ingredients', with: "Podhinhara, puri, water"
  fill_in 'Directions', with: "Do something amazing"
  click_button 'Update Recipe'
end

Then(/^I should see my updated recipe$/) do
  expect(page).to have_content "Title: #{@recipe.title}"
  expect(page).to have_content "Description: #{@recipe.description}"
  expect(page).to have_content "Ingredients: #{@recipe.ingredients}"
  expect(page).to have_content "Directions: #{@recipe.directions}"
end

