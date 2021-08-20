class StaticPagesController < ApplicationController
  
  def prix
    @prix = Stripe::Price.list(lookup_keys: ["basic_month", "medium_year"], expand: ["data.product"]).data.sort_by {|p| p.unit_amount}
  end
  
end