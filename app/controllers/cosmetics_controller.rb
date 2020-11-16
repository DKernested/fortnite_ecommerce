class CosmeticsController < ApplicationController
  def index
    @cosmetics = Cosmetic.all
  end
end
