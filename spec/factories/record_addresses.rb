FactoryBot.define do
  factory :record_address do
    post_code { '123-4567' }
    prefecture_id { 2 }
    municipalities { '札幌市' }
    block { '中央区' }
    apartment { 'ハイツ' }
    telephone { '00000000000' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
