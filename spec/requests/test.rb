# spec/controllers/posts_controller_spec.rb

require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  describe 'POST #create' do
    context 'with valid parameters' do
      it 'creates a new post and redirects to show_post_detail_path' do
        # Assuming you have defined 'response_from_api_call' and 'return_country_base_on_code' methods.
        allow(controller).to receive(:response_from_api_call).and_return({ source_language: 'en', translatedText: 'Translated Description' })
        allow(controller).to receive(:return_country_base_on_code).and_return('Country Name')

        post :create, params: { post: { description: 'Original Description', special_note: 'Special Note', reward: 1000 } }

        expect(response).to redirect_to(show_post_detail_path(assigns(:post)))
        expect(flash[:for_view_api]).to be_present

        # Check that the post was created with the correct attributes
        post = Post.last
        expect(post.description).to eq('Original Description')
        expect(post.special_note).to eq('Special Note')
        expect(post.reward).to eq(1000)
        expect(post.store_description).to eq('Translated Description')
        expect(post.store_special_note).to eq('Special Note has been translated from Country Name to English')
      end
    end

    context 'with invalid parameters' do
      it 'renders the new template with errors' do
        post :create, params: { post: { description: '', special_note: '', reward: nil } }

        expect(response).to render_template(:new)
        expect(flash[:for_view_api]).not_to be_present

        # Check that the post was not created due to validation errors
        expect(assigns(:post).errors).not_to be_empty
      end
    end
  end
end
