class CosmeticsController < ApplicationController
  def index
    @q = Cosmetic.ransack(params[:q])
    @cosmetics = @q.result(distinct: true)
  end

  def show
    @cosmetic = Cosmetic.find(params[:id])
  end
end
