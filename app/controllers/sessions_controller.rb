class SessionsController < ApplicationController
  def new
    render 'new'
  end

  def create
    # if authenticate true
    user = User.find_by_email(params[:user][:email]).try(:authenticate, params[:user][:password])
    if user
      # save user id to session
      session[:user_id] = user.id
      redirect_to "/events"
    else
      # add an error message -> flash[:errors] = ["Invalid"]
      flash[:errors] = ["Invalid Combination"]
      redirect_to :back
    end
  end

  def destroy
    session[:user_id]=nil
    redirect_to ''
  end
end
