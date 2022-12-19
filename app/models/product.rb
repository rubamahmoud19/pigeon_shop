class Product < ApplicationRecord

  has_and_belongs_to_many :baskets

  validates :name, :code, :price, presence: true
  validates :code, uniqueness: true

end
