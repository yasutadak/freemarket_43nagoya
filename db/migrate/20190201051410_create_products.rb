class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string  :name,               null: false, index:true
      t.integer :status,             null: false
      t.integer :shipping_method,    null: false
      t.string  :region,             null: false
      t.integer :shipping_timetable, null: false
      t.text    :description,        null: false
      t.integer :price,              null: false

      t.timestamps null: false

      t.references :seller, null: false, foreign_key: { to_table: :users }
      t.references :buyer,  null: false, foreign_key: { to_table: :users }
    end
  end
end
