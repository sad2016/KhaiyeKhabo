Given(/^there are members$/) do
  @roletwo = FactoryGirl.create :roletwo
  @memberone = FactoryGirl.create :memberone
  @membertwo = FactoryGirl.create :membertwo
end

Then(/^I should see a link for Member Profiles$/) do
  expect(page).to have_link('Member Profiles', href: users_path)

end

When(/^I click on the Member Profiles link$/) do
  find_link('Member Profiles', href: users_path).click

end

Then(/^I should see the list of members$/) do

  expect(page).to have_css('td', 'Member')

end