class ApplicationController < ActionController::Base
  before_action :authenticate_customer!
  before_action :initialize_session
  helper_method :cart
  helper_method :categories

  private

  def categories
    Category.all
  end

  def initialize_session
    # initialize the shopping cart
    session[:shopping_cart] ||= [] # Cosmetic id's will populate the array
  end

  def cart
    # Return a collection of product objects
    Cosmetic.find(session[:shopping_cart])
  end
end
