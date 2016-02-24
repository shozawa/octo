class PostsController < ApplicationController
  def create
    @version = Version.find_by(id: params[:version_id])
    @post = @version.posts.build(post_params)
    if @post.save
      respond_to do |format|
        format.html { render text: 'html' }
        format.js {}
      end
    else
    end
  end

  def index
    @posts = Post.where("version_id = ?", params[:version_id]).paginate(page: params[:page])
    respond_to do |format|
      format.html {}
      format.js {}
      format.json { render json: @posts  }
    end
  end

  private
    def post_params
      params.require(:post).permit([:content])
    end
end
