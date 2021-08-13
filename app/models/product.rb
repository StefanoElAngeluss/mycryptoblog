class Product < ApplicationRecord

  validates :name, :price, :description, presence: true

  def to_s
    name
  end

end
