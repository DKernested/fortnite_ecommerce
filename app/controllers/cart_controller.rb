class CartController < ApplicationController
  # POST /cart
  def create
    # Add params[:id] to cart
    # logger.debug("Adding #{params[:id]} to the cart")
    id = params[:id].to_i

    unless session[:shopping_cart].include?(id)
      session[:shopping_cart] << id
      flash[:notice] = "Item added to cart"
    end

    redirect_to root_path
  end

  # DELETE /cart/:id
  def destroy
    # Remove params[:id] from cart
    id = params[:id].to_i
    session[:shopping_cart].delete(id)
    cosmetic = Cosmetic.find(id)
    flash[:notice] = "#{cosmetic.name} removed from cart"
    redirect_to root_path
  end
end
