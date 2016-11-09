Given(/^I have two user profiles$/) do
    @another_user = FactoryGirl.build(:user, username: Faker::Internet.user_name, email: Faker::Internet.email)
    @another_user.skip_confirmation!
    @another_user.save

    if @user.blank?
      @user = FactoryGirl.build(:user, username: Faker::Internet.user_name, email: Faker::Internet.email)
      @user.skip_confirmation!
      @user.save
    end
end

Given(/^I have many posts for each user$/) do
  10.times.each { FactoryGirl.create(:post, user: @user) }
  10.times.each { FactoryGirl.create(:post, user: @another_user) }
end

Then(/^I should see the message "([^"]*)"$/) do |message|
  expect(page.has_content?(message)).to be true
end

When(/^I visit another user profile page$/) do
  visit user_profile_path(@another_user.username)
end

When(/^I visit the user profile page$/) do
  visit user_profile_path(@user.username)
end

Then(/^I should not view the follow button$/) do
  expect(page.all(:css, "a.follow-btn").length).to eq 0
end
