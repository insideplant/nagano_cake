class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :item

  def total_price
   self.item.price*self.amount
  end

  enum status: {
    cant_be_produced: 0,
    wating_produce: 1,
    producing: 2,
    produced: 3
  }

end
