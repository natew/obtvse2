class UsersController < ApplicationController
  before_action :require_login_unless_no_users

  def create
    @user = User.new(params.require(:user).permit(:email, :password, :password_confirmation))

    respond_to do |format|
      if @user.save
        auto_login @user
        format.html { redirect_to admin_path, notice: "Welcome!" }
      else
        format.html { render action: "new" }
      end
    end
  end

private

  def require_login_unless_no_users
    require_login unless no_users?
  end

end
