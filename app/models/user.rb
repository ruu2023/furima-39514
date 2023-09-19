class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates :password, format: { with: VALID_PASSWORD_REGEX, message: 'は半角英数を両方含む必要があります'},length: { minimum: 6 }
  validates :nickname, presence: true
  validates :surname, presence: true, format:{with:/\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/,message:"は全角ひらがな、全角カタカナ、漢字（でご入力下さい。"}
  validates :name, presence: true, format:{with:/\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/,message:"は全角ひらがな、全角カタカナ、漢字（でご入力下さい。"}
  validates :surname_kana, presence: true
  validates :name_kana, presence: true
  validates :birthday, presence: true
end
