# Допустим(/^залогинен пользователь с email "([^"]*)" и паролем "([^"]*)"$/) do |email, password|
#   visit('/users/sign_in')
#   within("#new_user") do
#     fill_in('user_email',    with: email)
#     fill_in('user_password', with: password)
#     click_button 'Log in'
#   end
# end

# Если(/^создаст заведение с данными:$/) do |table|
#   visit('/admin/places/new')
#   # within ("#new_place") do
#   #   fill_in('place_title_input',       with: table.hashes[0][:title])
#   #   fill_in('place_description_input', with: table.hashes[0][:description])
#   #   click_button 'Create Place'
#   # end
# end

# То(/^заведение "([^"]*)" видно в списке заведений$/) do |title|
#   visit('/admin/places')
#   page.has_content?("лорывалфрылвоафлыовралофывр")
# end

Given(/^I signed up with email "([^"]*)" and password "([^"]*)"$/) do |email, password|
  visit('/users/sign_in')
  within('#new_user') do
    fill_in('user_email', with: email)
    fill_in('user_password', with: password)
    click_button 'Log in'
  end
  expect(page).to have_css(".alert-success")
end

When(/^I add dish "([^"]*)" with id "([^"]*)" and price "([^"]*)"$/) do |title, id, price|
  visit('/shops/8')
  within("\##{id}") do
  	click_button("Add to cart")
  end
end

Then(/^I should see that "([^"]*)" appeared in cart$/) do |title|
  page.has_content?(title) 
end

