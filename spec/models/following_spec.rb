require 'rails_helper'

RSpec.describe Following, type: :model do
  it "save a valid relationship" do
    expect(FactoryGirl.build(:following)).to be_valid
  end
  it "dont save a relationship without a user" do
    expect(FactoryGirl.build(:following, user: nil)).not_to be_valid
  end
  it "dont save a relationship without a follower" do
      expect(FactoryGirl.build(:following, follower: nil)).not_to be_valid
    end

    it "dont save a relationship with user following himself" do
      user = FactoryGirl.create(:user)
      expect(FactoryGirl.build(:following, user: user, follower: user)).not_to be_valid
    end

    it "a user can`t follow the same user twice" do
      user = FactoryGirl.create(:user)
      another_user = FactoryGirl.create(:another_user)
      FactoryGirl.create(:following, user: user, follower: another_user)
      expect(FactoryGirl.build(:following, user: user, follower: another_user)).not_to be_valid
    end
end
