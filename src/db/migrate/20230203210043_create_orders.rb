class CreateOrders < ActiveRecord::Migration[7.0]
  def up
    create_table :orders do |t|
      t.decimal :total, precision: 8, scale: 2
      t.integer :status

      t.references :customer, foreign_key: true

      t.timestamps
    end
  end

  def down
    drop_table :orders
  end
end
