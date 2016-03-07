class WelcomeController < ApplicationController
  def index
    @projects = Project.all
    @user = User.find(current_user)
  end
end
