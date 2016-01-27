class SessionsController < ApplicationController
  skip_before_action :authenticate, only: [:new, :create]

  def new
  end

  def create
    uid = Author.authenticate(params[:session][:username], params[:session][:password], request.remote_ip)
    if uid
      session['user.id'] = uid
      redirect_to root_path
    else
      flash.now[:danger] = 'Invalid user/password combination'
      render 'new'
    end
  end
end
