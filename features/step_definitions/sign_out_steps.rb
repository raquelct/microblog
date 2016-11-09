Given(/^that I have signed in$/) do
  step 'that I am on the sign_in page'
  step 'I fill in my username and password'
  step 'click in "Sign In"'
end

When(/^I click in the "([^"]*)" link$/) do |link_name|
  find_link(link_name).click
end
