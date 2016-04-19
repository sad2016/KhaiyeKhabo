Given(/^I visit the Home page$/) do
  visit '/'
end

Then(/^I should see a link for About page$/) do
  expect(page).to have_link('About', href: site_about_path)
end

When(/^I click on the About page$/) do
  find_link('About', href: site_about_path).click
end

Then(/^I should see the About page$/) do
  expect(page).to have_content ('p')
end
