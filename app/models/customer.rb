class Customer < ApplicationRecord
  belongs_to :user, optional: true
  has_many :comments, dependent: :destroy

  with_options presence: true do
    validates :family_name_kana, :first_name_kana,
              :birthday, :gender, :address

    # 郵便番号（ハイフンあり7桁）
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/ }

    # 電話番号（ハイフンなし10・11桁）
    validates :phone_number, format: { with: /\A\d{10,11}\z/ }

    # 全角ひらがな、カタカナ、漢字のバリデーション
    VALID_NAME_REGEX = /\A[ぁ-んァ-ン一-龥]/.freeze
    validates :family_name, format: { with: VALID_NAME_REGEX }
    validates :first_name, format: { with: VALID_NAME_REGEX }

    # 全角カタカナのバリデーション
    VALID_KANA_REGEX = /\A[ァ-ヶー－]+\z/.freeze
    validates :family_name_kana, format: { with: VALID_KANA_REGEX }
    validates :first_name_kana, format: { with: VALID_KANA_REGEX }

    validates :age, inclusion: { in: 0..130 }
  end
end
