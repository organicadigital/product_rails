require "friendly_id"
class Product < ActiveRecord::Base

  extend FriendlyId

  validates :sku, :name, :unity, :stock, :min_stock, presence: true
  validates :sku, uniqueness: true
  validates :stock, :min_stock, numericality: {only_integer: true}
  validates :price, :tax, :weight, numericality: {greater_than_or_equal_to: 0}

  friendly_id :slug_candidates, use: [:slugged, :finders]

  def slug_candidates
    [[:name, :sku]]
  end

end
