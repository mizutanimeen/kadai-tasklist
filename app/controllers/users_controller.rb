class UsersController < ApplicationController
  
  def new
    @user = User.new
  end
    
  def create
    @user = User.new(user_params)
    
    if @user.save
      flash[:success] = "アカウントを作成しました"
      redirect_to "/tasks"
    else
      flash[:danger] = "アカウントを作成できませんでした"
      render :new
    end
  end
  
  def destroy
    @user = User.find_by(id: session[:user_id])
    @user.destroy
    flash[:success] = "アカウントを削除しました"
    redirect_to root_url
  end
    
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
