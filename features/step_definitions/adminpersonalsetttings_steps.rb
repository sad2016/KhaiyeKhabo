Given(/^I am an admin$/) do
  @roleone = FactoryGirl.create :roleone
  @user = FactoryGirl.create :admin
  @recipe = FactoryGirl.create :recipe, :user_id => @user.id
end

Given(/^I am signed in$/) do
  visit '/users/sign_in'
  fill_in 'Email', with: @user.email
  fill_in 'Password', with: @user.password
  click_button 'Log in'
end

Then(/^I should see a link for Edit Personal Settings$/) do
  expect(page).to have_link('Edit Personal Settings', href: edit_user_path(@user.id))
end

When(/^I click on the Edit Personal Settings link$/) do
  find_link('Edit Personal Settings', href: edit_user_path(@user.id)).click
end

Then(/^I should see an Edit Personal Settings form$/) do
  expect(page).to have_selector("form#edit_user_#{@user.id}")
end

When(/^I submit the Edit Personal Settings form$/) do
  fill_in 'Full Name', with: "Nabil Tahmidul Karim"
  fill_in 'Occupation', with: "Student"
  fill_in 'Other Interests (Besides Cooking)', with: "Music"
  fill_in 'Favourite Cook Book', with: "The Hungry Student Cook Book"
  click_button 'Update'
end

Then(/^I should see my personal settings updated$/) do
  expect(page).to have_content "Full Name: #{@user.fullname}"
  expect(page).to have_content "Email: #{@user.email}"
  expect(page).to have_content "Username: #{@user.username}"
  expect(page).to have_content "Date of Birth: #{@user.datebirth}"
  expect(page).to have_content "Occupation: #{@user.occupation}"
  expect(page).to have_content "Other Interests: #{@user.otherinterest}"
  expect(page).to have_content "Favourite Cook Book: #{@user.favcookbook}"
  expect(page).to have_content "Location: #{@user.location}"
end
