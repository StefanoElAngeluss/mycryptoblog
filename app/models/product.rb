class Product < ApplicationRecord

  validates :name, :price, :description, presence: true

  def to_s
    name
  end

  after_create do
    product = Stripe::Product.create(name: name)
    price = Stripe::Price.create(product: product, unit_amount: self.price, currency: "eur")
    update(stripe_product_id: product.id, stripe_price_id: price.id)
  end

end
