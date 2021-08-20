class StaticPagesController < ApplicationController
  
  def prix
    @prix = Stripe::Price.list(lookup_keys: ["medium_year", "basic_month"], expand: ["data.product"]).data.sort_by {|p| p.unit_amount}
  end
  
end