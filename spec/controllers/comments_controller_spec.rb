require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.
#
# Also compared to earlier versions of this generator, there are no longer any
# expectations of assigns and templates rendered. These features have been
# removed from Rails core in Rails 5, but can be added back in via the
# `rails-controller-testing` gem.

RSpec.describe CommentsController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # Comment. As you add validations to Comment, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    build(:comment, commentable: create(:user)).attributes.except("id", "created_at", "updated_at")
  }

  let(:invalid_attributes) {
    build(:invalid_comment, commentable: create(:user)).attributes.except("id", "created_at", "updated_at")
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # CommentsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      comment = Comment.create! valid_attributes
      get :index, params: { user_id: create(:user) }, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      comment = Comment.create! valid_attributes
      get :show, params: {id: comment.to_param}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #new" do
    before do
      sign_in create(:user)
    end
    it "returns a success response" do
      get :new, params: { user_id: create(:user) }, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #edit" do
    before do
      sign_in create(:user)
    end
    it "returns a success response" do
      comment = Comment.create! valid_attributes
      get :edit, params: {id: comment.to_param}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "POST #create" do
    before do
      sign_in create(:user)
    end
    context "with valid params" do
      it "creates a new Comment" do
        expect {
          post :create, params: {comment: valid_attributes, user_id: valid_attributes['commentable_id']}, session: valid_session
        }.to change(Comment, :count).by(1)
      end

      it "redirects to the created comment" do
        post :create, params: {comment: valid_attributes, user_id: valid_attributes['commentable_id']}, session: valid_session
        expect(response).to redirect_to(Comment.last)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {comment: invalid_attributes, user_id: invalid_attributes['commentable_id']}, session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe "PUT #update" do
    before do
      sign_in create(:user)
    end
    context "with valid params" do
      let(:new_attributes) {
        build(:comment).attributes.except("id", "created_at", "updated_at")
      }

      it "updates the requested comment" do
        comment = Comment.create! valid_attributes
        put :update, params: {id: comment.to_param, comment: new_attributes}, session: valid_session
        comment.reload
        expect(comment.attributes.fetch_values(*new_attributes.keys)).to be == new_attributes.values
      end

      it "redirects to the comment" do
        comment = Comment.create! valid_attributes
        put :update, params: {id: comment.to_param, comment: valid_attributes}, session: valid_session
        expect(response).to redirect_to(comment)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        comment = Comment.create! valid_attributes
        put :update, params: {id: comment.to_param, comment: invalid_attributes}, session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe "DELETE #destroy" do
    before do
      sign_in create(:user)
    end
    it "destroys the requested comment" do
      comment = Comment.create! valid_attributes
      expect {
        delete :destroy, params: {id: comment.to_param}, session: valid_session
      }.to change(Comment, :count).by(-1)
    end

    it "redirects to the comments list" do
      comment = Comment.create! valid_attributes
      commentable = comment.commentable
      delete :destroy, params: {id: comment.to_param}, session: valid_session
      expect(response).to redirect_to([commentable, Comment])
    end
  end

end
