FactoryBot.define do
  factory :user do
    nickname              { 'テスト' }
    email                 { Faker::Internet.free_email }
    password              { '111aaa' }
    password_confirmation { password }
    last_name             { '苗字' }
    first_name            { '名前' }
    last_name_kana        { 'ミョウジ' }
    first_name_kana       { 'ナマエ' }
    birth_date            { '1930-01-01' }
  end
end
