class CosmeticsController < ApplicationController
  def index
    @cosmetics = Cosmetic.search(params[:search])
  end

  def show
    @cosmetic = Cosmetic.find(params[:id])
  end
end
