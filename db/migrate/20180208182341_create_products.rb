class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :title
      t.text :description
      t.decimal :price
      t.integer :quantity
      t.boolean :is_sold_out, default: false

      t.timestamps
    end
  end
end
