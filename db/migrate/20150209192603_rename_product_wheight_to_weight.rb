class RenameProductWheightToWeight < ActiveRecord::Migration
  def change
    rename_column :products, :wheight, :weight
  end
end
