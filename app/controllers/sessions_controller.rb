class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by(name: sessions_params[:name])
    
    if @user && @user.authenticate(sessions_params[:password])
      session[:user_id] = @user.id

      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def destroy
    session.delete :user_id if session[:user_id]
    redirect_to root_path
  end

  private

  def sessions_params
    params.require(:user).permit(:name, :password)
  end
end