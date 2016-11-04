FactoryGirl.define do
  factory :user do
    name Faker::Name.name
    email Faker::Internet.email
    username Faker::Internet.user_name
    fake_password = Faker::Internet.password(8, 20, true, true)
    password fake_password
    password_confirmation fake_password
  end

  factory :another_user, class: 'User' do
    name Faker::Name.name
    email Faker::Internet.email
    username Faker::Internet.user_name
    fake_password = Faker::Internet.password(8, 20, true, true)
    password fake_password
    password_confirmation fake_password
  end
end
