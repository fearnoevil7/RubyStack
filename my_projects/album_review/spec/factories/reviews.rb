FactoryBot.define do
  factory :review do
    content { "Spectacular album can listen to it over and over again" }
    user { nil }
    rating { 5 }
    album { nil }
  end
end
