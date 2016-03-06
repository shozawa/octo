class VersionsController < ApplicationController
  def create
    @document = Document.find_by(id: params[:document_id])
    @version = @document.versions.build(version_params)
    if @version.save
    else
    end
    redirect_to @document
  end

  def show
    @version = Version.find_by(id: params[:id])
    @posts = Post.where("version_id=?", @version.id).page(1)
    respond_to do |format|
      format.html
      format.js {}
    end
  end

  private

    def version_params
      params.require(:version).permit(:attachment)
    end
end
