Given(/^I am in home page$/) do
  visit '/'
end

Given(/^there are recipes uploaded by users$/) do
  @user = FactoryGirl.create :admin
  @cuisine = FactoryGirl.create :cuisine
  @recipe = FactoryGirl.create :recipe, :user_id => @user.id, :cuisine_id => @cuisine.id
end

Then(/^I should see a link to View Recipe$/) do
  expect(page).to have_link('View Recipes', href: recipes_path)
end

Then(/^I should click on the View Recipe link$/) do
  find_link('View Recipes', href: recipes_path).click
end

Then(/^I should see a list of uploaded recipes$/) do
  expect(page).to have_css('ul', 'li')
end

Then(/^I should see a recipe$/) do
  expect(page).to have_css('p strong', 'Title')
end
