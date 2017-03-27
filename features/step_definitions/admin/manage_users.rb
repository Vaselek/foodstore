When(/^I go to the list of users$/) do
	visit '/admin/users'
	expect(page).to have_css('.admin_users')
end

Then(/^I should see user with name "([^"]*)"$/) do |name|
 page.should have_content(name)
end

Given(/^I am on the list of user$/) do
	visit '/admin/users'
end

When(/^I fill in name with "([^"]*)", email with "([^"]*)", password with "([^"]*)", password confirmation with "([^"]*)", phone with "([^"]*)" and address with "([^"]*)"$/) do |name, email, password, password_confirmation, phone, address|
  fill_in('user_name', with: name)
  fill_in('user_email', with: email)
  fill_in('user_password', with: password)
  fill_in('user_password_confirmation', with: password_confirmation)
  fill_in('user_phone', with: phone)
  fill_in('user_address', with: address)
end

Then(/^I should see that his email is "([^"]*)", phone is "([^"]*)" and address is "([^"]*)"$/) do |email, phone, address|
	page.has_content?(email)
	page.has_content?(phone)
	page.has_content?(address)
end

When(/^I follow "([^"]*)" for the user with css id "([^"]*)"$/) do |link, id|
  within("\##{id}") do
	  click_link(link)
	end
end

Then(/^I am on the view page of user with id (\d+)$/) do |id|
	visit "#{id}"
	page.should have_content('User Details')
end
