class CartItem < ApplicationRecord
  belongs_to :customer
  belongs_to :item

  def total_price
   self.item.price*self.amount
  end
  
end
