FactoryBot.define do
  factory :user do
    transient do
      person { Gimei.name }
    end
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.email }
    password              { '1a' + Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    surname { person.first.kanji }
    name { person.last.kanji }
    surname_kana { person.first.katakana }
    name_kana { person.last.katakana }
    birthday { Faker::Date.backward }
  end
end
