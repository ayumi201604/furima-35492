FactoryBot.define do
  factory :user do
    nickname {"tarou"}
    email {"sample3@gmail.com"}
    password {"aaa4567"}
    encrypted_password {"aaa4567"}
    first_name {"太郎"}
    last_name {"山田"}
    first_name_kana {"タロウ"}
    last_name_kana {"ヤマダ"}
    birth_day {"1930-01-31"}
  end
end