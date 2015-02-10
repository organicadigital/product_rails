class ChangeProductWeightAndDescriptionToAllowNull < ActiveRecord::Migration
  def change
    change_column_null :products, :description, true
    change_column_null :products, :weight, true
  end
end
