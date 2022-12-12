FactoryBot.define do
  factory :post do
    title { "Test title" }
    description  { "Test Description" }
    user
    # admin { false }
  end
end