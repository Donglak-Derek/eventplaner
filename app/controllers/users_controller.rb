class UsersController < ApplicationController
  def create
    if params[:user][:password] == params[:user][:password_confirmation]
      new_user = User.create(user_params)
    else
      flash[:errors] = ["Passwords do not match"]
        redirect_to :back
    end
      
    if new_user
      if new_user.valid?
        session[:user_id] = new_user.id
        redirect_to "/events"
      else
        flash[:errors] = new_user.errors.full_messages
        redirect_to :back
      end
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    user.update(first_name: params[:first_name], last_name: params[:last_name], email: params[:email], city: params[:city], state: params[:state])
    puts user.first_name, "update!!!!!!!!!!!!!!!!!!!!!"
    redirect_to "/events"
  end


  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :city, :state, :password)
  end
end
