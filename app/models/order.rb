class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_details, dependent: :destroy

  validates :postal_code,:address,:customer_name,:shipping_fee,:payment_amount,:payment_method,:status, presence: true

  enum payment_method: { credit: 0, bank_transfar: 1 }
  enum address_option_method: { self_address: 0,select_address:1, write_address:2}

  def total_price
   self.item.price*self.amount
  end

end
