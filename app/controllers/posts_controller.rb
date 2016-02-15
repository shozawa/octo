class PostsController < ApplicationController
  def create
    post = Post.new(post_params)
    document = Document.find_by(id: params[:document_id])
    post.version = document.versions.find_by(version_no: post.ex_version)
    if post.save
      redirect_to document
    else
      flash[:notice] = "投稿が失敗しました。"
    end

  end

  private
    def post_params
      params.require(:post).permit(:content)
    end
end
