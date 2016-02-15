class DocumentsController < ApplicationController
  def index
    @document = Document.new
    @documents = Document.all
  end

  def show
    @document = Document.find(params[:id])
    @versions = @document.versions
    @posts = @document.posts
  end

  def create
    @document = Document.new(document_params)
    if @document.save
      @document.versions.create(version_no: 0)
      redirect_to @document
    else
      flash[:notice] = "ドキュメントのアップロードに失敗しました。"
      redirect_to documents_path
    end
  end

  private

    def document_params
      params.require(:document).permit(:name)
    end
end
