When(/^I go to the note create page$/) do
	visit new_note_path
end

When(/^I go to the edit page for id "(.*)"$/) do |id|
	visit edit_note_path(id)
end

Then(/^I fill the form with title "(.*)" and body "(.*)"$/) do |title,body|
	page.fill_in "note[title]", with: title
	page.fill_in "note[body]", with: body
end

When(/^I click on save$/) do
	click_button 'Save'
end