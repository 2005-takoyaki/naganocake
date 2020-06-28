class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #新規登録時のバリデーション
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :kana_last_name, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/}
  validates :kana_first_name, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/}
  validates :postal_code, format: { with: /\A\d{7}\z/ }
  validates :address, presence: true
  validates :phone_number, format: {with: /\A\d{10,11}\z/}
  validate :password_complexity

  def password_complexity
    return if password.blank? || password =~ /\A[a-z0-9]+\z/i

    errors.add :password, 'は不正な値です'
  end


  has_many :ships, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :cart_products, dependent: :destroy
  has_many :order_products, through: :orders

end
