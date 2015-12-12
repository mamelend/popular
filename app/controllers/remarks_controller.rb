class RemarksController < ApplicationController

  def create
    remark = Remark.new(permit_params.merge(giver_id: current_user.id, receiver_id: params[:remark][:user_id], event_id: params[:event_id]))
    binding.pry
    if remark.save
      render text: "You've totally just put your rep on the line, person."
    else
      render text: "You've managed to mess up clicking."
    end
  end

private
  def permit_params
    params.require(:remark).permit(:remark_direction, :description, :photo)
  end

end