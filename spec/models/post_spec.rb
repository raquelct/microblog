require 'rails_helper'

RSpec.describe Post, type: :model do
  it "save a valid post" do
    expect(FactoryGirl.build(:post)).to be_valid
  end
  it "dont save a post without content" do
    expect(FactoryGirl.build(:post, content: nil)).not_to be_valid
  end
  it "dont save a post without a user" do
    expect(FactoryGirl.build(:post, user: nil)).not_to be_valid
  end
end
