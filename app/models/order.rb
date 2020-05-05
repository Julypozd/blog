class Order < ApplicationRecord
  belongs_to :customer
  validates_presence_of :customer
  validates :product_count, numericality: { only_integer: true }
  validates_presence_of :product_name
end
