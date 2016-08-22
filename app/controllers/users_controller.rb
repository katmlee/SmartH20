class UsersController < ApplicationController
  before_action :authorise_user, :only => [:index]
  before_action :check_for_user, :only => [:edit, :update]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def edit
    @user = @current_user
  end

  def update
  req = Cloudinary::Uploader.upload(params[:file])
  @user = @current_user
  @user.image = req["url"]
    if @user.update(user_params)
      redirect_to user_destinations_path(@user)
    else
      render :edit
    end
  end

  def show
    @user = User.find params[:id]
  end

  def destroy
    user = User.find params[:id]
    user.destroy
    redirect_to
    login_path
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :age, :weight, :image)
  end
  def check_for_user
  redirect_to new_user_path unless @current_user.present?
  end
end
