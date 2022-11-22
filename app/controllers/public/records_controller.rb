class Public::RecordsController < ApplicationController

  def create
    record = Record.new(record_params)
    record.user_id = current_user.id
    record.save
    redirect_to request.referer
  end

  def update
    record = Record.find(params[:id])
    record.update(record_params)
    redirect_to request.referer
  end

  private

  def record_params
    params.require(:record).permit(:species_id, :catch_number, :size)
  end
end
