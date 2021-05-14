class Item < ApplicationRecord
  attachment :image
  has_many :cart_items, dependent: :destroy
  has_many :order_details, dependent: :destroy
  belongs_to :genre

  with_options presence: true do
  validates :genre_id
  validates :name
  validates :image
  validates :price
  validates :introduction
  validates :is_active
  end



  def self.search(search)
    return Item.all unless search
    Item.where(['name LIKE ?', "%#{search}%"])
  end

end
