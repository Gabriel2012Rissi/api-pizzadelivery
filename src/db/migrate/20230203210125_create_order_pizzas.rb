class CreateOrderPizzas < ActiveRecord::Migration[7.0]
  def up
    create_table :order_pizzas do |t|
      t.references :order, foreign_key: true
      t.references :pizza, foreign_key: true
      t.integer :quantity
      t.decimal :subtotal

      t.timestamps
    end
  end

  def down
    drop_table :order_pizzas
  end
end
