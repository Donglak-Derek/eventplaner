class AttendeesController < ApplicationController
  def create
    Attendee.create(user: current_user, event: Event.find(params[:id]))
    @attendee = Attendee.where(user: current_user)
    redirect_to "/events"
  end

  def destroy
  	attendee = Attendee.find_by(event_id: params[:id])
  	attendee.destroy
  	redirect_to "/events"
  end
end
