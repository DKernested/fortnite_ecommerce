class CosmeticsController < ApplicationController
  def index
    render({ json: Cosmetic.all })
  end
end
