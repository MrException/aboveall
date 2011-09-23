class Admin::UsersController < SecureController
  before_filter :authenticate_user!
  load_and_authorize_resource

  def index
  end

  def edit
  end

  def update
    if @user.update_attributes(params[:user])
      redirect_to admin_users_path, notice: 'User was successfully updated.'
    else
      render action: "edit"
    end
  end

end
