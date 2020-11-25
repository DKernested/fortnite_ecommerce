class CheckoutController < ApplicationController
  def create
    cosmetic = Cosmetic.find(session[:shopping_cart])
    cosmetic_single = Cosmetic.find(params[:id])

    if cosmetic.nil?
      redirect_to root_path
      return
    end

    @session = Stripe::Checkout::Session.create(
      payment_method_types: ["card"],
      line_items:           [{
        name:        cosmetic_single.name,
        description: cosmetic_single.description,
        amount:      cosmetic_single.price,
        currency:    "cad",
        quantity:    1
      }],
      success_url:          checkout_success_url + "?session_id={CHECKOUT_SESSION_ID}",
      cancel_url:           checkout_cancel_url
    )

    respond_to do |format|
      format.js # render create.js.erb
    end
  end

  def success
    @session = Stripe::Checkout::Session.retrieve(params[:session_id])
    @payment_intent = Stripe::PaymentIntent.retrieve(@session.payment_intent)
  end

  def cancel; end
end
