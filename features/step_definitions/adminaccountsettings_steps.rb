Then(/^I should see a link for Edit Account Settings$/) do
  expect(page).to have_link('Edit Account Settings', href: edit_user_registration_path)
end

When(/^I click on the Edit Account Settings link$/) do
  find_link('Edit Account Settings', href: edit_user_registration_path).click
end

Then(/^I should see an Edit Accont Settings form$/) do
  expect(page).to have_selector("form#edit_user")
end

When(/^I submit the Edit Account Settings form$/) do
  fill_in 'Email', with: "ntk@ait.asia"
  fill_in 'Username', with: "ntk123"
  fill_in 'Password', with: "12345678"
  fill_in 'Password Confirmation', with: "12345678"
  fill_in 'Current Password', with: @user.password
  click_button 'Update'
end

Then(/^I should see my account settings updated$/) do
  visit "/users/#{@user.id}"
  expect(page).to have_content "Username: ntk123"
  expect(page).to have_content "Email: ntk@ait.asia"
end