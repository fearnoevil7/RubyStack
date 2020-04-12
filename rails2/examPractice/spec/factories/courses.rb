FactoryBot.define do
  factory :course do
    name { "MyString" }
    instructor { "MyString" }
    capacity { 1 }
    user { nil }
  end
end
