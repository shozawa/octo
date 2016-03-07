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

  def edit
    @post = Post.find(params[:id])
    respond_to do |format|
      format.js {}
    end
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(post_params)
      respond_to do |format|
        format.js {}
      end
    else
    end
  end

  def index
    @posts = Post.where("version_id = ?", params[:version_id]).page(params[:page])
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
