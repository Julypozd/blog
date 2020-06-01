FactoryBot.define do
  factory :driver do
    first_name { "MyString" }
    last_name { "MyString" }
    phone { 1 }
    email { "MyString" }
    customer { nil }
  end
end
