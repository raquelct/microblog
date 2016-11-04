require 'rails_helper'

RSpec.describe User, type: :model do

  it "save a valid user" do
    expect(FactoryGirl.build(:user)).to be_valid
  end
  it "dont save a user without a name" do
    expect(FactoryGirl.build(:user, name: nil)).not_to be_valid
  end
  it "dont save a user without a username" do
    expect(FactoryGirl.build(:user, username: nil)).not_to be_valid
  end
  it "dont save a user without a email" do
    expect(FactoryGirl.build(:user, email: nil)).not_to be_valid
  end
  it "dont save a user without a password" do
    expect(FactoryGirl.build(:user, password: nil)).not_to be_valid
  end
  it "dont save a user with a email as username" do
    expect(FactoryGirl.build(:user, username: Faker::Internet.email)).not_to be_valid
  end
  it "a post should belong to an user" do
    user = FactoryGirl.create(:user)
    post = FactoryGirl.create(:post, user: user)
    expect(user.posts.length).to eq 1
  end
  it "does not allow users with duplicated emails" do
    duplicated_email = Faker::Internet.email
    FactoryGirl.create(:user, email: duplicated_email)
    expect(FactoryGirl.build(:user, email: duplicated_email)).not_to be_valid
  end
  it "does not allow users with duplicated usernames" do
    duplicated_username = Faker::Internet.user_name
    FactoryGirl.create(:user, username: duplicated_username)
    expect(FactoryGirl.build(:user, username: duplicated_username)).not_to be_valid
  end

end
