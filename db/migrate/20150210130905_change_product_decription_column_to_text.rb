class ChangeProductDecriptionColumnToText < ActiveRecord::Migration
  def up
    change_column :products, :description, :text
  end

  def down
    Product.all.each do |product|
      product.update_attributes(description: truncate(product.description, 255))
    end
    change_column :products, :description, :string
  end
end
