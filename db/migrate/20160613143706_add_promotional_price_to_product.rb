class AddPromotionalPriceToProduct < ActiveRecord::Migration
  def change
    unless column_exists? :products, :promotional_price
      add_column :products, :promotional_price, :decimal, precision: 12, scale: 2
    end
  end
end
