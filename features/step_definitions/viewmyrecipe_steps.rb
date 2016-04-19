Given(/^I am signed in as admin\/member$/) do
  @roleone = FactoryGirl.create :roleone
  @user = FactoryGirl.create :admin
  @recipe = FactoryGirl.create :recipe, :user_id => @user.id
  visit '/users/sign_in'
  fill_in 'Email', with: @user.email
  fill_in 'Password', with: @user.password
  click_button 'Log in'
end

Then(/^I should see a link to My Recipe$/) do
  expect(page).to have_link('My Recipes', href: myrecipe_recipes_path)
end

Then(/^I should click on the My Recipe link$/) do
  find_link('My Recipes', href: myrecipe_recipes_path).click
end
