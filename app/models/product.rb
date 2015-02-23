require "friendly_id"
class Product < ActiveRecord::Base

  extend FriendlyId

  validates :sku, :name, :unity, :stock, :min_stock, presence: true
  validates :sku, uniqueness: true
  validates :stock, :min_stock, numericality: {only_integer: true}
  validates :price, numericality: {greater_than_or_equal_to: 0}, allow_nil: true
  validates :tax, numericality: {greater_than_or_equal_to: 0}, allow_nil: true
  validates :weight, numericality: {greater_than_or_equal_to: 0}, allow_nil: true

  friendly_id :slug_candidates, use: [:slugged, :finders]

  def slug_candidates
    [[:name, :sku]]
  end

end
