Then(/^I should see a link to Upload Recipe$/) do
  expect(page).to have_link('Upload a Recipe', href: new_recipe_path)
end

When(/^I click on the Upload Recipe link$/) do
  find_link('Upload a Recipe', href: new_recipe_path).click
end

Then(/^I should see an Upload Recipe form$/) do
  expect(page).to have_selector("form#new_recipe")
end

When(/^I submit the Upload Recipe form$/) do
  fill_in 'Title', with: "Pani Puri"
  fill_in 'Description', with: "Golgappa"
  fill_in 'Ingredients', with: "Podhinhara, puri, water"
  fill_in 'Directions', with: "Do something amazing"
  click_button 'Upload Recipe'
end

Then(/^I should see the recipe I uploaded$/) do
  expect(page).to have_content "Title:  Pani Puri"
  expect(page).to have_content "Description: Golgappa"
  expect(page).to have_content "Ingredients: Podhinhara, puri, water"
  expect(page).to have_content "Directions: Do something amazing"
end


