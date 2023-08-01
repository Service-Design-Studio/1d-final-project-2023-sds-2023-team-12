require 'rails_helper'

RSpec.describe PostsController, type: :controller do

    describe 'before actions' do
      describe 'load_user' do
        it 'is expected to define before action' do
          is_expected.to use_before_action(:set_post)
        end
      end
    end

    # index action
  describe 'GET #index' do
    before do
      get :index
    end

    it 'is expected to assign post instance variable' do
      expect(assigns[:posts]).to eq(Post.all)
    end

    it 'renders a successful response' do
        expect(response).to be_successful
    end

    it 'renders a correct view' do
        is_expected.to render_template(:index)
    end
  end

  # new action
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

  # edit action 
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

  #create
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

  # destroy detail
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