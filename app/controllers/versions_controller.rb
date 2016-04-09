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
    @posts = Post.where("version_id=?", @version.id).per_page_kaminari(1)
    respond_to do |format|
      format.html
      format.js {}
    end
  end

  def destroy
    version = Version.find_by(id: params[:id])
    document = version.document
    version.destroy
    redirect_to document
  end

  def download
    version = Version.find_by(id: params[:id])
    download_url = version.file.url
    file_name = version.file.current_path.split("/")[-1]
    content_type = version.file.content_type
    open(download_url, 'rb') do |data|
      send_data data.read, filename: file_name, type: content_type
    end
  end

  private

    def version_params
      params.require(:version).permit(:file)
    end
end
