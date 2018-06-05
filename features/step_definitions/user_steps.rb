When(/^I go to the registration page$/) do
	visit new_user_registration_path
end

Then(/^I should fill the form with email "(.*)" and password "(.*)"$/) do |email,password|
	page.fill_in "user[email]", with: email
	page.fill_in "user[password]", with: password
	page.fill_in "user[password_confirmation]", with: password
end

When(/^I click on register$/) do
	click_button 'Register'
end

Then(/^I should see the "(.*)" in home page$/) do |content|
	visit root_path
	expect(page).to have_content(content)
end

Then(/^I should see the "(.*)" in current page$/) do |content|
	expect(page).to have_content(content)
end