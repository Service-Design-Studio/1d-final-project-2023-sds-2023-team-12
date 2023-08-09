require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
    ############################################################
    # Testing index action of Comment controller
    describe 'check index action of comment controller' do
        before do
            # create dummy data using Facrtory bot
            user = create(:user)
            post = create(:post, user: user)
            @comment1 = create(:comment, user: user, post: post)
            @comment2 = create(:comment, user: user, post: post)
          end
      
          it "returns HTTP status 200" do
            get :index
            expect(response).to have_http_status(200)
          end
      
          it "assigns all comments to @comments" do
            get :index
            expect(assigns(:comments)).to match_array([@comment1, @comment2])
          end
      
          it "renders the index template" do
            get :index
            expect(response).to render_template(:index)
          end
    end

    ############################################################
    # Testing new action of Comment controller
    describe 'Testing new action of Comment controller' do
        before do
            user=create(:user)
            @post=create(:post,user: user)
        end

        it 'should render new template' do
            get :new
            expect(response).to render_template(:new)
        end

        it "returns HTTP status 200" do
            get :index
            expect(response).to have_http_status(200)
          end
    end

     ############################################################
    # Testing create action of Comment controller
    describe 'Testing create action of Comment controller' do
        ##### When user is not signed in
        context 'Create a comment for post when user is not signed in' do
            before do
                @user=create(:user)
                @post=create(:post,user: @user)
                
            end

            it 'should redirect to sign in session' do
                post :create, params: {
                    comment: {
                        body: "test",
                     user_id: @user.id,
                        post_id: @post.id
                    }
                }
                expect(response).to redirect_to(new_user_session_path())
            end

            it 'should see the notice' do
                post :create, params: {
                    comment: {
                        body: "test",
                        user_id: @user.id,
                        post_id: @post.id
                    }
                }
                expect(flash[:notice]).to eq("You have not sign in, please sign in!")
            end

            it 'should see the alert' do
                post :create, params: {
                    commnent: {
                        body: "test",
                        user_id: @user.id,
                        post_id: @post.id
                    }
                }
                expect(flash[:alert]).to eq("Got alert")
            end
        end


        #### when user is already signed in
        context 'Create a comment for post when user is signed in' do
            before do
                @user=create(:user)
                @post=create(:post,user: @user)
                sign_in @user
                
            end

            context 'comment is created successfully with valid input' do
                it 'reditect show post detail path' do
                    post :create, params: {
                        comment: {
                            body: "test",
                            user_id: @user.id,
                            post_id: @post.id
                        }
                    }

                    expect(response).to redirect_to(show_post_detail_path(@post.id))
                         # test front end
                         expect(response).to have_http_status(302)
                end

                it 'give successfully comment created notification' do
                    post :create, params: {
                        comment: {
                            body: "test",
                            user_id: @user.id,
                            post_id: @post.id
                        }
                    }

                    expect(flash[:notice]).to eq("Comment was successfully created.")
                    # test front end
                    expect(response).to have_http_status(302)

                end
            end

            context 'comment is unsuccessfully created with invalid input' do
                it 'reditect show post detail path' do
                    post :create, params: {
                        comment: {
                            body: "",
                            user_id: @user.id,
                            post_id: @post.id
                        }
                    }

                    expect(response).to redirect_to(show_post_detail_path(@post.id))
                    # test front end
                    expect(response).to have_http_status(302)
                end

                it 'give unsuccessful comment created notification' do
                    post :create, params: {
                        comment: {
                            body: "",
                            user_id: @user.id,
                            post_id: @post.id
                        }
                    }

                    expect(flash[:notice]).to eq("Comment can not be empty")
                    # test front end
                    expect(response).to have_http_status(302)
                end

                it 'display alert' do
                    post :create, params: {
                        comment: {
                            body: "",
                            user_id: @user.id,
                            post_id: @post.id
                        }
                    }

                    expect(flash[:alert]).to eq("Got alert")
                    # test front end
                    expect(response).to have_http_status(302)
                end
            end
        end
    end

    ########### Testing for update comment ############
  describe "Testing update action of comment" do
    before do
        @user=create(:user) 
        @post=create(:post, user: @user) 
        @comment=create(:comment, user: @user, post: @post) 
    end

    context "with valid parameters" do
      context "updates the comment and redirects to the post detail page with notice" do
        before do
            @update_comment="updated comment"
            patch :update, params: { 
                id: @comment.id, 
                comment: { 
                    body: "updated comment",
                    user_id: @user.id,
                    post_id: @post.id
                } 
            }
            @comment.reload
        end

        it 'body of comment must be updated' do
            expect(@comment.body).to eq(@update_comment)
        end

        it 'redirected to show all post detail' do
            expect(response).to redirect_to(show_post_detail_path(@post.id))
        end

        # test front end
        it 'should have 302 redirect' do
            expect(response).to have_http_status(302)
        end

        it 'show successful notification' do
            expect(flash[:notice]).to eq("Comment was successfully updated.")
        end
      end
    end



    context "with invalid parameters" do
        context "renders the edit template with unprocessable_entity status" do
            before do
                patch :update, params: { 
                    id: @comment.id, 
                    comment: { 
                        body: "",
                        user_id: @user.id,
                        post_id: @post.id
                    } 
                }
            end

            it 'show unprocessable_entity status' do
                expect(response).to have_http_status(:unprocessable_entity)
            end

            it 'show unprocessable_entity status' do
                expect(response).to render_template(:edit)
            end

        end
      end

end 


    ########### Testing for delete comment ############
  describe "Testing delete action of comment" do
    before do
         @user=create(:user) 
         @post=create(:post, user: @user) 
         @comment=create(:comment, user: @user, post: @post) 
         delete :destroy, params: { id: @comment.id }
    end

    it 'deleted comment id should removed from comment model' do
        expect(Comment.exists?(@comment.id)).to be_falsey
    end

    it 'redirect to show post detail page' do
        expect(response).to redirect_to(show_post_detail_path(@post.id))
    end

    it 'display notification for succesfull comment destroyed' do
        expect(flash[:notice]).to eq("Comment was successfully destroyed.")
    end

     # test front end
     it 'should have 302 redirect' do
        expect(response).to have_http_status(302)
    end
  end

end