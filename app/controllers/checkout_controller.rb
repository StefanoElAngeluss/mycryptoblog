class CheckoutController < ApplicationController

  def create
    @session = Stripe::Checkout::Session.create({
      customer: current_user.stripe_customer_id,
      success_url: posts_url,
      cancel_url: prix_url,
      payment_method_types: ['card'],
      line_items: [
        {price: params[:prix], quantity: 1},
      ],
      mode: 'subscription',
    })
    respond_to do |format|
      format.js
    end
  end

  def success
    if params[:session_id].present? 
      # session.delete(:cart)
      session[:cart] = [] # empty cart = empty array
      @session_with_expand = Stripe::Checkout::Session.retrieve({ id: params[:session_id], expand: ["line_items"]})
      @session_with_expand.line_items.data.each do |line_item|
        product = Product.find_by(stripe_product_id: line_item.price.product)
        product.increment!(:sales_count)
      end
    else
      redirect_to cancel_url, alert: "No info to display"
    end
  end

  def cancel
  end

end