class UsersController < ApplicationController
    
    def new
     @user = User.new
    end
    
    def confirm
 # # Note: We dont save this action on database 
     @user = User.new
     @user.name = params[:user][:name]
     @user.email = params[:user][:email]
     @user.password = params[:user][:password]
     @user.password_confirmation = params[:user][:password_confirmation]
    end 
    
def create
 # # Note: 
     @user = User.new
     @user.name = params[:user][:name]
     @user.email = params[:user][:email]
     @user.password = params[:user][:password]
     @user.password_confirmation = params[:user][:password_confirmation]
      
 # #10
     if @user.save
       flash[:notice] = "Welcome to Bloccit #{@user.name}!"
       redirect_to root_path
     else
       flash.now[:alert] = "There was an error creating your account. Please try again."
       render :new
     end
end

def user_params
   params.require(:user).permit(:email, :password, :password_confirmation)
end

 # This makes `user_params()` available in the view.
 helper_method :user_params

end
