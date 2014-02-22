# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    email "MyString"
    provider "MyString"
    uid "MyString"
    access_token "MyString"
    avatar_photo_url "MyString"
    name "MyString"
  end
end
