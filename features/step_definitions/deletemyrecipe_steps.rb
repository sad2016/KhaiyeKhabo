Then(/^I should find an option to delete the recipe$/) do
  expect(page).to have_link('Delete',@recipe.id)
end

When(/^I click on the delete recipe link$/) do
  find_link('Delete',@recipe.id).click
end

Then(/^I should see my recipe deleted$/) do
  visit '/recipes'
end
