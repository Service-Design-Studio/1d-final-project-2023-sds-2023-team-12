class PostsController < ApplicationController
  before_action :set_post, only: %i[ show edit update destroy ]

  # GET /posts or /posts.json
  def index
    if !params.key?(:user_id) # show all cases
      @posts = Post.all

      ### age filter ### 
      if params[:age_categories].present?
        age_cag_list = params[:age_categories]
        ##age categories is a virtual attr thus you need to use select
        filtered_post_ids = @posts.select { |post| age_cag_list.include?(post.age_category.to_s) }.pluck(:id)
        ##however, we want a query selection that returns an activerecord selection, so we need to use .where method instead, so we use a placeholder to select the ids
        @posts = @posts.where(id: filtered_post_ids)
      end

      ### age filter  ###

      ### sort by missing time 
      if params[:sort_by_recent].present?
        @posts = @posts.order(missing_time: :desc)
      end

      ###
      
    
    else # show your cases cases
      @posts = User.find_by(id: params[:user_id]).posts
    end


  end

  # GET /posts/1 or /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    unless user_signed_in?
      respond_to do |format|
        format.html { redirect_to new_user_session_path(), notice: "You have not sign in, please sign in!", alert: "Got alert"}
      end
    else
      @post = Post.new
    end
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts or /posts.json
  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to show_post_detail_path(@post), notice: "Post was successfully created, click on show cases to see your case" }
       ## format.html { redirect_to post_url(@post), notice: "Post was successfully created." }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to show_post_detail_path(@post), notice: "Post was successfully updated, click on show cases to see your case" }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def detail
    @post=Post.find_by(id: params[:id])
    @user_id=@post.user_id
    @user=User.find_by(id: @post.user_id)
    @comments=Comment.where(post_id: params[:id])
    @comment = Comment.new
    render "pdetail"
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_url, notice: "Post was successfully destroyed, we are happy that you have found your loved ones" }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:full_name, :age, :location, :description, :special_note, :user_id,:image,:missing_time)
    end
end
