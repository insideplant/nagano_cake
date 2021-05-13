class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_details, dependent: :destroy

  validates :postal_code,:address,:customer_name,:shipping_fee,:payment_amount,:payment_method,:status, presence: true

  enum status: {
    waiting: 0,
    paid_up: 1,
    processing: 2,
    preparing: 3,
    shipped: 4
  }

  def total_price
   self.item.price*self.amount
  end

end
