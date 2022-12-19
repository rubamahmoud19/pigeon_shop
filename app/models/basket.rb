class Basket < ApplicationRecord
  has_and_belongs_to_many :products

  after_create :set_total

  def set_total
    update(total: products.pluck(:price).sum)
  end
end
