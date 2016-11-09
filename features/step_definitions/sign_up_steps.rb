Given(/^I am in the sign up page$/) do
  visit new_user_registration_path
end

When(/^I fill all fields in form$/) do
  password = Faker::Internet.password(8,20,true,true)
  @email = Faker::Internet.email
  fill_in "user_name", with: Faker::Internet.name
  fill_in "user_email", with: @email
  fill_in "user_username", with: Faker::Internet.user_name
  fill_in "user_password", with: password
  fill_in "user_password_confirmation", with: password
end

When(/^click in "([^"]*)"$/) do |button|
  find_button(button).click
end

Then(/^a new user must be created$/) do
  user = User.find_by_email(@email)
  expect(user).not_to be_nil
  expect(user.confirmation_token).not_to be_nil
end

Then(/^I should be redirected to the homepage$/) do
  expect(current_path).to eq(root_path)
end
