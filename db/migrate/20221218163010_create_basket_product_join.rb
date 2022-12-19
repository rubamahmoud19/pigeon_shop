class CreateBasketProductJoin < ActiveRecord::Migration[7.0]

  def change
    create_table :baskets_products, id: false do |t|
      t.belongs_to :basket, index: true
      t.belongs_to :product, index: true
    end
  end
end
