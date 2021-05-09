class Item < ApplicationRecord
  attachment :image
  has_many :cart_items, dependent: :destroy
  belongs_to :genre
  
  with_options presence: true do
  validates :genre_id
  validates :name
  validates :image
  validates :price
  validates :introduction
  validates :is_active
  end

end
