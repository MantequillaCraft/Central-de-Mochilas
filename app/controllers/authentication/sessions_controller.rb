class Authentication::SessionsController < ApplicationController

  skip_before_action :protect_pages
  before_action :protect_current_user, only: [:new, :create]

  def new
  end

  def  create
    @user = User.find_by("username = :login", { login: params[:login]} )

    if @user&.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to products_path
    else
      redirect_to new_session_path, alert: "Invalid email/username or password."
    end
  end


  def destroy
    session.delete(:user_id)
    redirect_to root_path
  end
  

  private

  def protect_current_user
    if Current.user
      redirect_to root_path
    end
  end

end