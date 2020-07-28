class UsersController < ApplicationController
  #  skip_before_action :verified_user, only: [:new, :create]
    def new
        @user = User.new
        render 'users/signup'
    end
    
   def create
        
#binding.pry
       if @user = User.create(user_params)
        #binding.pry
            session[:user_id]= @user.id
           
        redirect_to user_path(@user)
        else
        render 'new'
        end

    end

    def show
        #binding.pry
        # if !verified_user
         #    redirect_to '/'
         #else
         #    @user = User.find_by(id: params[:id])
         #end
         @user = User.find_by(id: params[:id])
           if current_user !=@user
            redirect_to '/'
         end
        end
# signing up for website for the first time users controller should handle sign up, go to users/new to create an account and user is returning direct them to the sign in sessions page
    def home
        render 'users/homepage'
    end 
    private

    def user_params
        params.require(:user).permit(:name, :height, :nausea, :happiness, :tickets, :password, :admin)
    end

    
end
