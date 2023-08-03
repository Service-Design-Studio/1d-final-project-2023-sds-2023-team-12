class PostsController < ApplicationController
  before_action :set_post, only: %i[ show edit update destroy ]

  # GET /posts or /posts.json
  def index
    @posts = Post.all
    if params[:search].present?
      @posts = Post.search(params[:search])
    end

    if !params.key?(:user_id) # show all cases
      #@posts = Post.all

      #sort by dropdown
      sort_by = params[:sort_by]
      case sort_by
      when 'alphabetical'
        @posts = @posts.order(full_name: :asc)
      when 'recently_posted'
        @posts = @posts.order(created_at: :desc)
      when 'recently_missing'
        @posts = @posts.order(missing_time: :desc)
      when 'highest_rewards'
        @posts = @posts.order(reward: :desc)
      else
        @posts = @posts.order(created_at: :desc)
      end
      

      ### age filter ### 
      if params[:age_categories].present?
        age_cag_list = params[:age_categories]
        ##age categories is a virtual attr thus you need to use select
        filtered_post_ids = @posts.select { |post| age_cag_list.include?(post.age_category.to_s) }.pluck(:id)
        ##however, we want a query selection that returns an activerecord selection, so we need to use .where method instead, so we use a placeholder to select the ids
        @posts = @posts.where(id: filtered_post_ids)
      end

      if params[:genders].present?
        selected_genders = params[:genders]
        @posts = @posts.where(gender: selected_genders)
      else
        @selected_genders = []
      end



      if params[:genders].present?
        selected_genders = params[:genders]
        @posts = @posts.where(gender: selected_genders)
      else
        @selected_genders = []
      end



    else # show your cases cases
      @posts = User.find_by(id: params[:user_id]).posts
    end

    # Storing selected filters to keep state persistent
    @selected_age_categories = params[:age_categories] || []
    @selected_genders = params[:genders] || [] 
    @sort_by = params[:sort_by] || 'recently_posted'

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
    unless @post.reward
      @post.update(reward: 0)
    end
    
    respond_to do |format|
      if @post.save
        for_view=Hash.new
        output_from_api_description=response_from_api_call(@post.description)
        output_from_api_note=response_from_api_call(@post.special_note)

        unless (output_from_api_description[:source_language] == 'en')
          flash[:test2]=output_from_api_description[:source_language]
          flash[:test1]=return_country_base_on_code(output_from_api_description[:source_language])
          # @post.update(description: output_from_api_description[:translatedText])
          @post.update(store_description: output_from_api_description[:translatedText])

          @post.save
          for_view[:description]="Description has been translated from #{return_country_base_on_code(output_from_api_description[:source_language])} to English \n"
          flash[:help]=1
        else
          @post.update(store_description: @post.description)
          @post.save

        end

        unless (output_from_api_note[:source_language] == "en")
          # @post.update(special_note: output_from_api_note[:translatedText])
          @post.update(store_special_note: output_from_api_note[:translatedText])

          @post.save
          for_view[:note]="Special Note has been translated from #{return_country_base_on_code(output_from_api_note[:source_language])} to English"
        else
          @post.update(store_special_note: @post.special_note)
          @post.save

        end

        flash[:for_view_api]=for_view
        format.html { redirect_to show_post_detail_path(@post), notice: "Post was successfully created, click on show cases to see your case"}
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
        for_view=Hash.new
        output_from_api_description=response_from_api_call(@post.description)
        output_from_api_note=response_from_api_call(@post.special_note)

        unless (output_from_api_description[:source_language] == 'en')
          flash[:test2]=output_from_api_description[:source_language]
          flash[:test1]=return_country_base_on_code(output_from_api_description[:source_language])
          # @post.update(description: output_from_api_description[:translatedText])
          @post.update(store_description: output_from_api_description[:translatedText])
          @post.save
          for_view[:description]="Description has been translated from #{return_country_base_on_code(output_from_api_description[:source_language])} to English \n"
          flash[:help]=1
        else
          @post.update(store_description: @post.description)
          @post.save
        end

        unless (output_from_api_note[:source_language] == "en")
          # @post.update(special_note: output_from_api_note[:translatedText])
          @post.update(store_special_note: output_from_api_note[:translatedText])
          @post.save
          for_view[:note]="Special Note has been translated from #{return_country_base_on_code(output_from_api_note[:source_language])} to English"
        else
          @post.update(store_special_note: @post.special_note)
          @post.save
        end

        flash[:for_view_api]=for_view

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

  # The following three actions handle API call front end side and only return JSON objects
  def question_1
    @post=Post.find_by(id: params[:id])
    # first_answer=response_text_from_openai_api_call(ApplicationController.question_one(@post.full_name))
    first_answer=response_text_from_openai_api_call(@post.description, @post.special_note, @post.full_name, 1)

    render json: { status: "success", data: first_answer }  
  end

  def question_2
    @post=Post.find_by(id: params[:id])
    second_answer=response_text_from_openai_api_call(@post.description, @post.special_note, @post.full_name, 2)

    render json: { status: "success", data: second_answer }  
  end

  def question_3
    @post=Post.find_by(id: params[:id])
    third_answer=response_image_from_openai_api_call(ApplicationController.question_third(@post.store_description,@post.full_name))
    
    render json: { status: "success", data: third_answer }  
  end



  # DELETE /posts/1 or /posts/1.json
  def destroy
    @post.comments.destroy_all
    @post.destroy

    respond_to do |format|
      format.html { redirect_to user_posts_path(current_user), notice: "Post was successfully destroyed, we are happy that you have found your loved ones" }
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
      params.require(:post).permit(:full_name, :age, :location, :description, :special_note, :user_id,:image,:missing_time,:avatar,:reward,:gender)
    end

  private
  def get_most_recent_image_id(bucket_name)
    storage = Google::Cloud::Storage.new
    bucket = storage.bucket(bucket_name)

    # List all objects in the bucket
    blobs = bucket.files

    # Sort the blobs by their creation time in descending order (most recent first)
    sorted_blobs = blobs.sort_by { |blob| blob.created_at }.reverse

    # Get the ID (name) of the most recently added image
    if sorted_blobs.any?
      most_recent_blob = sorted_blobs.first
      return most_recent_blob.name
    else
      return nil
    end
  end


  private


end
