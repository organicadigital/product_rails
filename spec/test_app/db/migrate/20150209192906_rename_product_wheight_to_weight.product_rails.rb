# This migration comes from product_rails (originally 20150209192603)
class RenameProductWheightToWeight < ActiveRecord::Migration
  def change
    rename_column :products, :wheight, :weight
  end
end
