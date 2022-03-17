FactoryBot.define do
  factory :purchaser_shipping do
    postal_code              { '123-4567' }
    prefecture_id            { 2 }
    city                     { '市区町村' }
    addresses                { '番地' }
    building                 { '建物名' }
    phone_number             { '09012345678' }
    token                    { 'tok_abcdefghijk00000000000000000' }
  end
end
