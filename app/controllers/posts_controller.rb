class PostsController < ApplicationController

  before_action :owner?, only: [:edit, :destroy]

  def create
    @version = Version.find_by(id: params[:version_id])
    @post = @version.posts.build(post_params)
    @post.user_id = current_user.id

    if @post.save
      if @post.id
        respond_to do |format|
          format.html { render text: 'html' }
          format.js {}
        end
      end
    else
    end
  end

  def edit
    @post = Post.find(params[:id])
    respond_to do |format|
      format.js {}
      format.html { render text: @post.content }
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    respond_to do |format|
      format.js {  }
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
    @posts = Post.where("version_id = ?", params[:version_id]).per_page_kaminari(params[:page])
    respond_to do |format|
      format.html {}
      format.js {}
      format.json { render json: @posts  }
    end
  end

  private
    def post_params
      params.require(:post).permit([:content, :version_id])
    end

    def owner?
      post = Post.find_by(id: params[:id])
      if  current_user == post.user
      else
        ## todo : 本当はルートではなく404? 403?ページヘ飛ばしたい
        redirect_to root_path
      end
    end
end
