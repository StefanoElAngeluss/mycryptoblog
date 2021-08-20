class SubscriptionController < ApplicationController

  def create
    payload = request.body.read
    sig_header = request.env['HTTP_STRIPE_SIGNATURE']
    event = nil

    begin
      event = Stripe::Webhook.construct_event(
        payload, sig_header, Rails.application.credentials[:stripe][:webhook]
      )
    rescue JSON::ParserError => e
      status 400
      return
    rescue Stripe::SignatureVerificationError => e
      # Invalid signature
      puts "Signature error"
      p e
      return
    end

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

end