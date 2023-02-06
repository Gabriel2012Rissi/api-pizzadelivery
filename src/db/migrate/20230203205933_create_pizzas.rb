class CreatePizzas < ActiveRecord::Migration[7.0]
  def up
    create_table :pizzas do |t|
      t.string :name
      t.text :description
      t.string :code
      t.decimal :price, precision: 8, scale: 2

      t.timestamps
    end
    add_index :pizzas, :code, unique: true
  end

  def down
    drop_table :pizzas
  end
end
