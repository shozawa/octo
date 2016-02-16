class ProjectsController < ApplicationController
  def index
    @projects = Project.all
    @project = Project.new
  end

  def show
  end

  def new
  end

  def create
  end
end
