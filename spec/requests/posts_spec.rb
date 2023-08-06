require 'rails_helper'

RSpec.describe PostsController, type: :controller do

    describe 'before actions' do
      describe 'load_user' do
        it 'is expected to define before action' do
          is_expected.to use_before_action(:set_post)
        end
      end
    end

    # Test index action of post controller
    describe 'GET #index' do
      it 'renders the index template' do
        get :index
        expect(response).to render_template(:index)
      end

    context 'with no search parameter' do
      it 'fetches all posts' do
        # Create a single user instance and an associated post list with 3 posts
        user = create(:user)
        posts = create_list(:post, 3, user: user)

        # Send the request to the index action
        get :index

        # Expect the controller to assign the fetched posts to @posts
        expect(assigns(:posts).size).to eq(3) # or expect(assigns(:posts).count).to eq(3)
      end

      it 'sorts by alphabetical order' do
        # Create posts with specific names for alphabetical ordering test
        user=create(:user)
        post_a = create(:post, full_name: 'Alice', user: user)
        post_b = create(:post, full_name: 'Bob', user: user)

        # Send the request with sort_by parameter set to 'alphabetical'
        get :index, params: { sort_by: 'alphabetical' }

        # Ensure the posts are ordered by full_name in ascending order
        expect(assigns(:posts)).to eq([post_a, post_b])
      end

      it 'sorts by recently posted' do
        # Create posts with different created_at timestamps for ordering test
        user=create(:user)
        post_old = create(:post, created_at: 2.days.ago,user: user)
        post_new = create(:post, created_at: Time.now, user: user)

        # Send the request with sort_by parameter set to 'recently_posted'
        get :index, params: { sort_by: 'recently_posted' }

        # Ensure the posts are ordered by created_at in descending order
        expect(assigns(:posts)).to eq([post_new, post_old])
      end

      it 'sorts by recently missing' do
        # Create posts with different missing_time timestamps for ordering test
        user=create(:user)
        post_old_missing = create(:post, missing_time: 2.days.ago,user: user)
        post_new_missing = create(:post, missing_time: Time.now, user: user)

        # Send the request with sort_by parameter set to 'recently_missing'
        get :index, params: { sort_by: 'recently_missing' }

        # Ensure the posts are ordered by missing_time in descending order
        expect(assigns(:posts)).to eq([post_new_missing, post_old_missing])
      end

      it 'sorts by higest rewards' do
        # Create posts with different missing_time timestamps for ordering test
        user=create(:user)
        low_reward_missing = create(:post, reward: 300 ,user: user)
        high_reward_missing = create(:post, reward: 500 , user: user)

        # Send the request with sort_by parameter set to 'recently_missing'
        get :index, params: { sort_by: 'highest_rewards' }

        # Ensure the posts are ordered by missing_time in descending order
        expect(assigns(:posts)).to eq([high_reward_missing, low_reward_missing])
      end
    end

    context 'sort by gender - by male' do
      it 'sort by gender' do
        user=create(:user)
        male_post_missing_1=create(:post,gender: "Male",user: user)
        male_post_missing_2=create(:post,gender: "Male",user: user)
        female_post_missing_1=create(:post,gender: "Female",user: user)
        female_post_missing_2=create(:post,gender: "Female",user: user)

        get :index, params: {
          genders: "Male"
        }

        expect(assigns(:posts)).to eq([male_post_missing_2, male_post_missing_1])
      end
    end

    context 'sort by gender - by female' do
      it 'sort by gender - by female' do
        user=create(:user)
        male_post_missing_1=create(:post,gender: "Male",user: user)
        male_post_missing_2=create(:post,gender: "Male",user: user)
        female_post_missing_1=create(:post,gender: "Female",user: user)
        female_post_missing_2=create(:post,gender: "Female",user: user)

        get :index, params: {
          genders: "Female"
        }

        expect(assigns(:posts)).to eq([female_post_missing_2, female_post_missing_1])
      end
    end

    ##### test searching function 
    context 'testing searching functionality of post controller index action' do
      before do
        user=create(:user)
        @post_four=create(:post,full_name: "Test",location: "A",user: user)
        @post_three=create(:post,full_name: "Alpha",location: "A",user: user)
        @post_two=create(:post,full_name: "Alpha",location: "A",user: user)
        @post_one=create(:post,full_name: "Alpha",location: "A",user: user)

      end

      it 'search by location of missing person' do
        get :index, params: { search: "A" }
        expect(assigns(:posts)).to eq([@post_one,@post_two,@post_three,@post_four])
      end

      it 'search by name of missing person' do
        get :index, params: { search: "Alpha" }
        expect(assigns(:posts)).to eq([@post_one,@post_two,@post_three])
      end

    end


    context 'with user_id parameter' do
      it 'fetches posts for the given user' do
        user = create(:user)
        user_posts = create_list(:post, 3, user: user)

        # Send the request with user_id parameter set to the user's ID
        get :index, params: { user_id: user.id }

        # Ensure the correct user's posts are fetched
        expect(assigns(:posts)).to eq(user_posts)
      end
    end
  end




    # Test new action of post controller
    describe "GET #new" do
    context "when user is not signed in" do
      it "redirects to the sign-in page with a notice and alert" do
        get :new
        expect(response).to redirect_to(new_user_session_path)
        expect(flash[:notice]).to eq("You have not sign in, please sign in!")
        expect(flash[:alert]).to eq("Got alert")
      end
    end

    context "when user is signed in" do
      it "renders the new post form" do
        # Create a user and sign them in (Assuming you have Devise or a similar authentication system)
        new_user = FactoryBot.build :user

        sign_in new_user
        get :new, params: {
            user_id: new_user.id 
        }
        # expect(response).to render_template(:new)
    end
    end
  end

    # Test edit action of post controller
    describe 'GET #edit ' do 
    it 'render :edit' do
      new_user= FactoryBot.create :user
      new_post = FactoryBot.create :post
      new_post.user_id=new_user.id
      get :edit, params: {
        user_id: new_post.user_id,  
        id: new_post.id
      }
      expect(response).to render_template(:edit)
    end
  end 

  # Test create action of post controller - not robust test
  describe 'Get #create' do
    context 'invalid input for post' do
    it 'redirected to new post path to refill the form' do
      new_user = FactoryBot.build :user

      image_path = Rails.root.join('spec', 'fixtures', 'young-adult.png')

      post :create, params: {
        post: {
          full_name: "test",
          age: 32,
          location: "test",
          description: "test",
          special_note: "test",
          user_id: new_user.id,
          missing_time: "Sat, 17 Jun 2023 21:33:00 +0000",
          reward: 300,
          gender: "Male",
          image: Rack::Test::UploadedFile.new(image_path, 'image/png')
        #   avatar: Rack::Test::UploadedFile.new(image_path, 'image/png')
        }
      }
      expect(response).to render_template(:new)
    end
end 

context 'valid input for post' do
    it 'successfully create a new post' do
      new_user = FactoryBot.build :user

      image_path = Rails.root.join('spec', 'fixtures', 'young-adult.png')

      post :create, params: {
        post: {
          full_name: "test",
          age: 32,
          location: "test",
          description: "test",
          special_note: "test",
          user_id: new_user.id,
          missing_time: "Sat, 17 Jun 2023 21:33:00 +0000",
          reward: 300,
          gender: "Male",
          image: Rack::Test::UploadedFile.new(image_path, 'image/png')
        #   avatar: Rack::Test::UploadedFile.new(image_path, 'image/png')
        }
      }
        end
    end
  end

    # Test create action of post controller - not robust test
    # describe 'check create action of post controller' do
    #   context 'create a new post with valid parameters' do
    #     it 'a new post with valid parameters and redirect to show post detail page' do

    #     new_user = FactoryBot.build :user

    #     # Assuming you have defined 'response_from_api_call' and 'return_country_base_on_code' methods.
    #     allow(controller).to receive(:response_from_api_call).and_return({ source_language: 'vn', translatedText: 'i love you' })
    #     allow(controller).to receive(:return_country_base_on_code).and_return('Vietnamese')

    #     image_path = Rails.root.join('spec', 'fixtures', 'young-adult.png')


    #     # Set session data if needed
    #     session[:user_id] = 1

    #     # Create a new CSRF token and include it in the request headers
    #     csrf_token = SecureRandom.base64(32)
    #     request.headers['X-CSRF-Token'] = csrf_token

    #     post :create, params: {
    #       post: {
    #         full_name: 'John Doe',
    #         age: 30,
    #         location: 'New York',
    #         description: 'anh yeu em',
    #         special_note: 'anh yeu em',
    #         user_id: new_user.id,
    #         missing_time: 'Sat, 17 Jun 2023 21:33:00 +0000',
    #         reward: 1000,
    #         gender: 'male',
    #         image: nil
    #       }
    #     }

    #     # expect(response).to redirect_to(show_post_detail_path(assigns(:post).id))
    #     # expect(response).to be_redirect

    #     # Check that the post was created with the correct attributes
    #     post = Post.last
    #     expect(post.full_name).to eq('John Doe')
    #     expect(post.age).to eq(30)
    #     expect(post.location).to eq('New York')
    #     expect(post.description).to eq('I love you')
    #     expect(post.special_note).to eq('I love you')
    #     expect(post.user_id).to eq(1)
    #     expect(post.missing_time).to eq(Time.zone.parse('2023-06-17 21:33:00'))
    #     expect(post.reward).to eq(1000)
    #     expect(post.gender).to eq('male')
    #     expect(post.store_description).to eq('anh yeu em')
    #     expect(post.store_special_note).to eq('anh yeu em')
    #   end
    # end
          
    # end



  # destroy post 
  describe 'destroy an existing post in the database' do
    it 'sucessfully remove a new post' do
        new_user= FactoryBot.create :user
        sign_in new_user
        new_post = FactoryBot.create :post
        new_post.user_id=new_user.id
        delete :destroy, params: {
          user_id: new_post.user_id,  
          id: new_post.id
        }
        expect(response).to redirect_to(user_posts_path(new_user.id))
    end
  end 



  # post detail
  describe 'show detail of post' do
    it 'render show detail of a post' do
        new_user= FactoryBot.create :user
        new_post = FactoryBot.create :post
        new_post.user_id=new_user.id
        get :detail, params: {
          id: new_post.id  
        }
        expect(response).to be_successful
    end
  end 

end