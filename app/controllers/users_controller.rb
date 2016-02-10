class UsersController < ApplicationController
  before_action :set_current_user, only: [:edit, :update]
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcom to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end
  
  def update
    if @user.update(user_params)
      redirect_to root_path, notice: 'プロフィールを編集しました'
    else
      render 'edit'
    end
  end

  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation, :location)
  end

  def set_current_user
    @user = User.find(current_user.id)
  end
end
