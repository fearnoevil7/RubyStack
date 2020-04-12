FactoryBot.define do
  factory :album do
    title { "Thriller" }
    author { "Michael Jackson" }
    rating { 5 }
    user { nil }
  end
end
