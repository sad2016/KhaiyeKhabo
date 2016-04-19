Then(/^I should see a link for Contact Us$/) do
  expect(page).to have_link('Contact', href: new_contact_path)
end

When(/^I click on the Contact Us link$/) do
  find_link('Contact', href: new_contact_path).click
end

Then(/^I should see a Contact Us form$/) do
  expect(page).to have_selector("form#new_contact")
end

When(/^I submit the Contact Us form$/) do
  fill_in 'Full Name', with: "Nabil Tahmidul Karim"
  fill_in 'Email', with: "Student"
  fill_in 'Subject', with: "Music"
  fill_in 'Comment', with: "The Hungry Student Cook Book"
  click_button 'Send'
end

Then(/^I should see a confirmation that my message has been sent$/) do
  expect(page).to have_css('p', 'Comment successfully sent')
end
