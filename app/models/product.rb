class Product < ApplicationRecord
  has_many :line_items, dependent: :delete_all
  has_many :orders, through: :line_items
private
  def ensure_not_referenced_by_any_line_item
    unless line_items.empty?
      errors.add(:base, 'Line Items Present')
      throw :abort
    end
  end
end
