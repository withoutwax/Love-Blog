class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  # before_action :configure_devise_params, if: :devise_controller?

  def index
    @posts = Post.all.order('created_at DESC')
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    # @post = Post.new

    # After Devise setup:
    @post = current_user.posts.build
  end

  def create
    # @post = Post.new(post_params)

    # After Devise setup:
    @post = current_user.posts.build(post_params)

    if @post.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to root_path
  end

  # def configure_devise_params
  #   devise_parameter_sanitizer.for(:sign_up) do |u|
  #     u.permit(:username, :name, :email, :password, :password_confirmation)
  #   end
  # end

  private
    def post_params
      params.require(:post).permit(:title, :body)
    end


end
