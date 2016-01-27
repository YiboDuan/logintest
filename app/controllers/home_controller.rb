class HomeController < ApplicationController
  def home
    @rules = current_user.rules
  end
end
