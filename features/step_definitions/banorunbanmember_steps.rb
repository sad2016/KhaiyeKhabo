Then(/^I should see a link to ban or unban a member$/) do
  expect(page).to have_link('Ban/Unban Member',@membertwo.id)
end

When(/^I click on ban or unban link$/) do
  @membertwo.isbanned = !@membertwo.isbanned
  find_link('Ban/Unban Member',match: :first).click
end


Then(/^I should see the updated status of that member$/) do
  visit ("/users/#{@membertwo.id}")
end