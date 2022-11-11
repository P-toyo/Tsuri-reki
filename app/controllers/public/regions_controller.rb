class Public::RegionsController < ApplicationController
  def index
    @regions = Region.all
  end
end
