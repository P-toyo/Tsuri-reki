class Public::HomesController < ApplicationController
  def top
    @regions = Region.all
  end
end
