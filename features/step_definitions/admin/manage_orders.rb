Given(/^I have order with id (\d+)$/) do |id|
 Order.first == Order.find("#{id}")
end

When(/^I go to the list of orders$/) do
	visit('/admin/orders')
	expect(page).to have_css(".admin_orders")
end

Then(/^I should see order with css id "([^"]*)"$/) do |css_id|
  page.has_content?(css_id)
end

Given(/^I have (\d+) order$/) do |number_of_orders|
	expect(Order.count).to eq(number_of_orders.to_i)
end

Given(/^I am on the list of order$/) do
	visit('/admin/orders')
  expect(page).to have_css(".admin_orders")
end

When(/^I select option "([^"]*)" from "([^"]*)"$/) do |title, select_name|
	select(title, :from => select_name)
end

When(/^I follow "([^"]*)" for the order with css id "([^"]*)"$/) do |link, id|
	within("\##{id}") do
		click_link(link)
	end
end

Then(/^I am on the view page of order with id (\d+)$/) do |id|
	visit("#{id}")
	page.has_content?('Order Details')
end


