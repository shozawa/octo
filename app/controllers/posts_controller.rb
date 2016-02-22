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
    version = Version.find_by(id: params[:version_id])
    @posts = version.posts
    respond_to do |format|
      format.html {}
      format.js {}      
    end
  end

  private
    def post_params
      params.require(:post).permit([:content])
    end
end
