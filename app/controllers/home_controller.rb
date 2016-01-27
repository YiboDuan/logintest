class HomeController < ApplicationController
  def home
    @rules = current_user.rules
    @ip = request.remote_ip
  end
end
