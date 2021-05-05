class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_details, dependent: :destroy
  
  validates :postal_code,:address,:customer_name,:shipping_fee,:payment_amount,:payment_method,:status, presence: true
  
  enum payment_method_option: { credit: 0, ginko: 1 }
  
end
