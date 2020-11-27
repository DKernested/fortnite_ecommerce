class CheckoutController < ApplicationController
  def create
    # cosmetic = Cosmetic.find(session[:shopping_cart])
    cosmetic_single = Cosmetic.find(params[:id])
    @cosmetic_instance = cosmetic_single.id

    province_tax = Province.find_by(id: current_customer.province_id)

    if cosmetic_single.nil?
      redirect_to root_path
      return
    end

    @session = Stripe::Checkout::Session.create(
      payment_method_types: ["card"],
      customer_email:       current_customer.email,
      line_items:           [{
        name:        cosmetic_single.name,
        description: cosmetic_single.description,
        amount:      cosmetic_single.price,
        currency:    "cad",
        quantity:    1
      },
                             {
                               name:        "PST",
                               description: "#{province_tax.name} Provincial Sales Tax",
                               amount:      (cosmetic_single.price * province_tax.pst_rate).round.to_i,
                               currency:    "cad",
                               quantity:    1
                             },
                             {
                               name:        "GST/HST",
                               description: "Government Sales Tax or Harmonized Sales Tax",
                               amount:      (cosmetic_single.price * province_tax.gst_hst_rate).round.to_i,
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
    @session = Stripe::Checkout::Session.retrieve(params[:session_id], { expand: "line_items" })
    @payment_intent = Stripe::PaymentIntent.retrieve(@session.payment_intent)
    @cosmetic_id = @cosmetic_instance
  end

  def cancel; end
end
