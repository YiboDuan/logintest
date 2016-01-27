class UsersController < ApplicationController
    skip_before_action :authenticate, only: [:new, :create]
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)    # Not the final implementation!
        if @user.save
          flash.now[:success] = "Welcome!"
          redirect_to root_path
        else
          render 'new'
        end
    end

    private

    def user_params
        params.require(:user).permit(:username, :password, :password_confirmation)
    end
end
