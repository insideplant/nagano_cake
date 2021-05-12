class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_details, dependent: :destroy

  validates :postal_code,:address,:customer_name,:shipping_fee,:payment_amount,:payment_method,:status, presence: true

  enum payment_method: { credit: 0, bank_transfar: 1 }

  enum status: {
    waiting: 0,
    paid_up: 1,
    preparing: 2,
    shipped: 3
  }

  def total_price
   self.item.price*self.amount
  end

end
