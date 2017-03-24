Given(/^I have shop titled "([^"]*)"$/) do |title|
  Shop.create!(:title => title)
end

When(/^I go to the list of shops$/) do
	visit('admin/shops')
end

Then(/^I should see "([^"]*)"$/) do |title|
  page.has_content?(title)
end



Given(/^I have (\d+) shops$/) do |number_of_shops|
	Shop.count == number_of_shops.to_i
end

Given(/^I am on the list of shop$/) do
 visit('/admin/shops')
end

When(/^I follow "([^"]*)"$/) do |link|
	click_link(link)	
end

When(/^I fill in title with "([^"]*)"$/) do |title|
  fill_in('shop_title', with: title)
end

When(/^I fill in description with "([^"]*)"$/) do |description|
	fill_in('shop_description', with: description)
end


When(/^I attach file$/) do
	page.attach_file("shop_logo", Rails.root + 'app/assets/images/fixtures/shops/1')
end


When(/^I press "([^"]*)"$/) do |button|
	click_button(button)
end

Then(/^I should have (\d+) shops$/) do |new_number_of_shops|
	Shop.count == new_number_of_shops.to_i
end

When(/^I follow "([^"]*)" for the shop with id "([^"]*)"$/) do |link, id|
	within("\##{id}") do
		click_link(link)
	end	
end

When(/^I confirm action in a pop\-up window$/) do
 page.driver.browser.switch_to.alert.accept
end

# Then(/^I should see "([^"]*)"$/) do |message|
# page_has_content?(message)
# end
