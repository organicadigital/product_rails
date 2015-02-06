# This migration comes from product_rails (originally 20150206104816)
class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :slug, null: false, unique: true, index: true
      t.string :sku, null: false, unique: true, index: true
      t.string :name, null: false
      t.string :description, null: false
      t.string :unity, null: false
      t.decimal :price, default: 0, precision: 12, scale: 2
      t.decimal :tax, default: 0, precision: 12, scale: 2
      t.integer :stock, null: false, default: 0
      t.integer :min_stock, null: false, default: 0
      t.decimal :wheight, null: false, default: 0, precision: 12, scale: 3
      t.boolean :enabled
      t.timestamps
    end
  end
end
