class CosmeticsController < ApplicationController
  def index
    @cosmetics = Cosmetic.search(params[:search]).paginate(page: params[:page], per_page: 60)
  end

  def show
    @cosmetic = Cosmetic.find(params[:id])
  end
end
