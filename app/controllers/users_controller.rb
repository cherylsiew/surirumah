class UsersController < ApplicationController

def new
  @user = User.new
end

def create
  @user = User.new(user_params)  
  if @user.save
    session[:user_id] = @user.id
    redirect_to root_path
  else
    flash[:error] = 'An error occured! Try Signing Up Again'
    render 'new'
  end
end



private
def user_params
  params.require(:user).permit(:first_name, :last_name, :password, :email, :address1, :address2, :postcode, :country, :telephone)
end

end
