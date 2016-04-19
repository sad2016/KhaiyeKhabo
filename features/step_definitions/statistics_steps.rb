Then(/^I should see a link for Statistics$/) do
  expect(page).to have_link('Statistics', href: statistics_index_path)
end

When(/^I click on the Statistics link$/) do
  find_link('Statistics', href:statistics_index_path).click
end

Then(/^I should see different statistics on member registration$/) do
  expect(page).to have_css('div', 'chart-1')
  expect(page).to have_css('div', 'chart-2')
  expect(page).to have_css('div', 'chart-3')
end