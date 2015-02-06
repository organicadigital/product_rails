require "friendly_id"
class Product < ActiveRecord::Base

  extend FriendlyId

  validates :sku, :name, :description, :unity, :stock, :min_stock, :wheight, presence: true
  validates :sku, uniqueness: true
  validates :stock, :min_stock, numericality: {only_integer: true}
  validates :price, :tax, :wheight, numericality: {greater_than_or_equal_to: 0}

  friendly_id :slug_candidates, use: [:slugged, :finders]

  def slug_candidates
    [[:name, :sku]]
  end

end