FactoryBot.define do
  factory :user do
    email { "abc@mail.com" }
    username  { "abc" }
    password {"123456"}
  end
end