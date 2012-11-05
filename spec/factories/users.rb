# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    name "MyString"
    password "MyString"
    disk_space 1
    bandwidth 1
  end
end
