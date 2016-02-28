class DocumentsController < ApplicationController
  before_action :is_member?
  def index
    @project = Project.find_by(id: params[:project_id])
    @documents = @project.documents
    @document = Document.new
    @document.versions.build
  end

  def new
    @project = Project.find_by(id: params[:project_id])
    @document = @project.documents.build
    @document.versions.build
  end

  def show
    @document = Document.find(params[:id])
    @versions = @document.versions
    @post = Post.new
  end

  def create
    @project = Project.find_by(id: params[:project_id])
    @document = @project.documents.build(document_params)
    if @document.save
      redirect_to @document
    else
      flash[:notice] = "ドキュメントのアップロードに失敗しました。"
      redirect_to documents_path
    end
  end

  private

    def document_params
      params.require(:document).permit(
      :name,
      versions_attributes: [:id, :attachment])
    end

    def is_member?
      user = User.find(current_user)
      my_project_ids = user.project_users.pluck(:project_id)
      current_project_id = params[:project_id].to_i
      unless my_project_ids.include?(current_project_id)
        redirect_to projects_path
      end
    end
end
