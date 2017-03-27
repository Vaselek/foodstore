Given(/^I have cart with id (\d+)$/) do |id|
  Order.first == Order.find("#{id}")
end

When(/^I go to the list of carts$/) do
  visit('/admin/carts')
  expect(page).to have_css(".admin_carts")
end

Then(/^I should see cart with css id "([^"]*)"$/) do |css_id|
  expect(page).to have_css("#cart_1")
end

When(/^I follow "([^"]*)" for the cart with css id "([^"]*)"$/) do |link, id|
  within("\##{id}") do
    click_link(link)
  end
end

Then(/^I am on the view page of cart with id (\d+)$/) do |id|
  visit("#{id}")
  expect(page).to have_content('Cart Details')
end
