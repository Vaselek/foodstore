When(/^I follow "([^"]*)" button$/) do |link|
	visit(root_path)
	click_link(link)
end
