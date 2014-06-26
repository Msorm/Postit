class PostsController < ApplicationController
  before_action :set_post, only: [:edit, :update, :show, :vote] 
  before_action :require_user, except: [:show, :index]


  def index
  	@posts = Post.all.sort_by{ |x| x.total_votes }.reverse
  end

  def show
    @comment = Comment.new
  end

  def new
  	@post = Post.new
  end

  def create
  	@post = Post.new(post_params)
    @post.user = current_user

    if @post.save
      flash[:notice] = "Your post has been saved"
      redirect_to post_path(@post)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      flash[:notice] = "This post was updated"
      redirect_to post_path(@post)     

     else
     render :edit
     end 
  end

  def vote
    @vote = Vote.create(voteable: @post, user: current_user, vote: params[:vote])

    respond_to do |format|
        format.html do
          if @vote.valid?
            flash[:notice] = "You vote was counted"
          else
            flash[:error] = "You have already voted"
          end
          redirect_to :back
        end
        format.js
    end 
  end


  private

  def post_params
    params.require(:post).permit(:title, :url, :description, category_ids: [])
  end

  def set_post
    @post = Post.find(params[:id])
  end

end
