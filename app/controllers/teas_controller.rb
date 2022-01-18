class TeasController < ApplicationController
  def index
    teas = Tea.all
    render json: { data: teas }
  end
end
