class Order < ApplicationRecord
  has_many :line_items, dependent: :destroy
  belongs_to :user, optional: true
  enum pay_type: {
    "Check"       =>0,
    "Credit card" =>1,
    "Pay Pal"     =>2
  }
  validates :name, :adress, :email, presence: true
  validates :pay_type, inclusion: pay_types.keys

  def add_line_items_from_cart(cart)
    cart.line_items.each do |item|
      item.cart_id = nil
      line_items << item
    end
  end
end
