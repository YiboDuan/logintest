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
      if uid == false
        flash.now[:danger] = 'Did not match with rule(s)!'
      else
        flash.now[:danger] = 'Invalid user/password combination!'
      end
      render 'new'
    end
  end

  def destroy
    session.delete('user.id')
    @current_user = nil
    redirect_to root_path
  end
end
