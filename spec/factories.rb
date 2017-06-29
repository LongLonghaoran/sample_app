FactoryGirl.define do
  factory :micropost do
    content "MyString"
    user_id 1
  end
  factory :user do
    name  "longhr"
    email "123@132.com"
    password "12345678"
    password_confirmation "12345678"
end
end
