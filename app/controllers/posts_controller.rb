class PostsController < ApplicationController

  # GET /posts or /posts.json
  def index
    @posts = Post.all
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  # POST /posts or /posts.json
  def create
    @post = Post.new(content: params[:post][:content])
    if params[:back]
      render :new
    else
      if @post.save
        redirect_to posts_path, notice: "Post was successfully created."
      else
        render :new
      end
    end
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    @post = Post.find(params[:id])
    if @post.invalid?
      render :new
    else
      @post.update(content: params[:post][:content])
      redirect_to posts_path
    end
  end

  # DELETE /posts/1 or /posts/1.json

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path, notice: "Post was successfully destroyed." 
  end
  
  def confirm
    @post = Post.new(content: params[:post][:content])
    render :new if @post.invalid?
  end
end
