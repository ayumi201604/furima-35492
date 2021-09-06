FactoryBot.define do
  factory :user do
    nickname {Faker::Name.last_name}
    email {Faker::Internet.free_email}
    password = Faker::Internet.password(min_length: 6)
    password {password}
    password_confirmation {password}
    first_name {"太郎"}
    last_name {"太郎"}
    first_name_kana {"ヤマダ"}
    last_name_kana {"タロウ"}
    birth_day {"1930-01-31"}
  end
end