class EventsController < ApplicationController
  def index
    # @in_state_events = Event.all.where(state: current_user.state)
    # @out_state_events = Event.all.where.not(state: current_user.state)
    @in_state_events = Event.eager_load(:user, :users_joined).where(state: current_user.state)
	  @out_state_events = Event.eager_load(:user, :users_joined).where.not(state: current_user.state)
  end

  def show
  	@event = Event.find(params[:id])
  	@attendees = @event.users_joined
  	# p @comments = @event.comments
  end

  def create
      event = Event.create(event_params)
      event.user_id = current_user.id
      event.save
      # p params[:id], event.user_id
      redirect_to events_index_path(params[:id])
  end

  def destroy
  	event = Event.find(params[:id])
  	event.destroy
  	redirect_to "/events"
  end

  def edit
  	@event = Event.find(params[:id])
  end

  def update
  	event = Event.find(params[:id])
  	event.update(event_params)
  	redirect_to events_index_path
  end


	private
	  def event_params
	    params.require(:event).permit(:name, :date, :city, :state)
	  end
end
