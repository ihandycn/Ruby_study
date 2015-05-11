class UsersController < ApplicationController
  def signup
    @user = User.new
  end
  
  def create
    user = User.new(user_params)
    puts "~~~~~~~ [S]"
    # puts user.first
    puts "~~~~~~~ [E]"
    if user.save
      puts "~~~~~~~ [user.save ture]"
    else
      puts "~~~~~~~ [user.save false]"
    end
    redirect_to :root
  end
  
  def create_login_session
    user = User.find_by_name(params[:name])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to :root
    else
      redirect_to :login
    end
  end
  
  def logout
    session[:user_id] = nil
    redirect_to :root
  end
  
  private
    def user_params
      # [Keith] This can not work.
      # params.require(:user).permit
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
