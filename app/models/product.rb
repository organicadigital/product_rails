require "friendly_id"
class Product < ActiveRecord::Base

  extend FriendlyId

  validates :sku, :name, :unity, :stock, :min_stock, presence: true
  validates :sku, uniqueness: true
  validates :stock, :min_stock, numericality: {only_integer: true}
  validates :price, numericality: {greater_than_or_equal_to: 0}, allow_nil: true
  validates :promotional_price, numericality: {greater_than_or_equal_to: 0}, allow_nil: true
  validates :tax, numericality: {greater_than_or_equal_to: 0}, allow_nil: true
  validates :weight, numericality: {greater_than_or_equal_to: 0}, allow_nil: true

  friendly_id :slug_candidates, use: [:slugged, :finders]

  scope :promotional, -> { where('promotional_price is not null and promotional_price > 0') }

  def slug_candidates
    [[:name, :sku]]
  end

  def current_price
    promotional_price? ? promotional_price : price
  end

  def promotional_price?
    promotional_price.present? && promotional_price.to_i > 0
  end

  def promotional_discount
    promotional_price? ? (1 - promotional_price / price) * 100 : 0
  end

end
