class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_details, dependent: :destroy
  
  validates :postal_code,:address,:customer_name,:shipping_fee,:payment_amount,:payment_method,:status, presence: true
  
  enum payment_method: { credit: 0, bank_transfar: 1 }
  
end
