class CreateCustomers < ActiveRecord::Migration[7.0]
  def up
    create_table :customers do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone
      t.string :address

      t.timestamps
    end
    add_index :customers, :phone, unique: true
  end

  def down
    drop_table :customers
  end
end
