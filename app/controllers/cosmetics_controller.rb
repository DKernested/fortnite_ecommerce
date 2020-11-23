class CosmeticsController < ApplicationController
  def index
    @q = Cosmetic.ransack(params[:q])
    @cosmetics = @q.result.page params[:page]
  end

  def show
    @cosmetic = Cosmetic.find(params[:id])
  end
end
