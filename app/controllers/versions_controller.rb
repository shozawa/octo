class VersionsController < ApplicationController
  def create
    @document = Document.find_by(id: params[:document_id])
    @version = @document.versions.build
    current_version = @document.versions.maximum(:version_no)
    @version.version_no = current_version + 1
    if @version.save
    else
    end
    redirect_to @document
  end
end
