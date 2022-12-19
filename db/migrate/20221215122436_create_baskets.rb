class CreateBaskets < ActiveRecord::Migration[7.0]
  def change
    create_table :baskets do |t|
      t.float :total
      t.float :discount
      t.float :to_pay

      t.timestamps
    end
  end
end
