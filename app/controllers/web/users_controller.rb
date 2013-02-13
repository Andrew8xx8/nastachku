class Web::UsersController < Web::ApplicationController

  def index
    @users = User.shown_as_participants.alphabetically
  end

  def new
    @user = UserEditType.new
  end

  def create
    @user = UserEditType.new(params[:user])

    if @user.save
      UserMailer.welcome(@user).deliver
      sign_in @user
      flash_success
      redirect_to root_path
    else
      flash_error
      render action: "new"
    end
  end

end