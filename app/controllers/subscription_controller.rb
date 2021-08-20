class SubscriptionController < ApplicationController

  def create
    @session = Stripe::Checkout::Session.create({
      customer: current_user.stripe_customer_id,
      payment_method_types: ['card'],
      line_items: [
        {price: params[:prix], quantity: 1},
      ],
      mode: 'subscription',
      success_url: posts_url,
      cancel_url: prix_url,
    })
    respond_to do |format|
      format.js
    end
  end

end