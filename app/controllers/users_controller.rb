class UsersController < BaseController
  before_action :user, only: [:show]

  def index; end

  def new
    @user = User.new
  end

  def show
    
  end

  def create
    user = User.new(user_params)
    user.save

    flash.notice = "Create user successfully"
    redirect_to user
  end

  private

  def user
    @user ||= User.find_by(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :password)
  end
end