class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :email, presence: true, uniqueness: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :cart_items, dependent: :destroy
  has_many :addresses, dependent: :destroy
  has_many :orders, dependent: :destroy

  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |customer|
      customer.user_name = "Guest"
      customer.password = SecureRandom.urlsafe_base64
      customer.postal_code = "1111111"
      customer.addresse = "1111111"
      customer.last_name = "Guest"
      customer.telephone_number = "11111111111"
      customer.first_name = "Guest"
      customer.last_name_kana = "ゲスト"
      customer.first_name_kana = "ゲスト"
      customer.is_active = true
    end
  end
end
