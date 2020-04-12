FactoryBot.define do
  factory :user do
    last_name { "Song" }
    trait :male do
      first_name {"Jonathon"}
      email { "jonsong94@yahoo.com" }
      end
    trait :female do
      first_name {"Tess"}
      email { "tesssong@yahoo.com" }
    end
  end
end
