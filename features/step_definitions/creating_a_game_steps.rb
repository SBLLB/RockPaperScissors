Given(/^I am on the homepage$/) do
	visit '/'
end

When(/^I enter a "(.*?)"$/) do |arg1|
 fill_in :player1_name, :with => "Rachel"
 click_button 'Get Started'
end

Then(/^I will see "(.*?)"$/) do |arg|
	expect(page).to have_content)"You'll be playing against the Rock, Paper, Scissors computer")
end
