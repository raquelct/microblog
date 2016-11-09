FactoryGirl.define do
  factory :following do
    association :user, factory: :user
    association :follower, factory: :another_user
  end
end
