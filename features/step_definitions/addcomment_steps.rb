Then(/^I should see a form to add a comment$/) do
  expect(page).to have_selector("form#new_comment")
end

When(/^I add the comment$/) do
  fill_in 'Comment', with: "Wooh nice recipe"
  click_button 'Add a comment'
end

Then(/^I should see my comment added to that recipe$/) do
  expect(page).to have_css('p')
end
