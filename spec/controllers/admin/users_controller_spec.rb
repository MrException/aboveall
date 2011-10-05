require 'spec_helper'

describe Admin::UsersController do
  login_admin

  let(:user) { mock_model(User).as_null_object }

  before do
    User.stub(:find).and_return(user)
    # this seems to be the only way to stub out the :all method with CanCan
    #ActiveRecord::Relation.any_instance.stub(:joins).and_return(products)
  end

  describe "GET 'index'" do
    it "should be successful" do
      get 'index'
      response.should be_success
    end

    it "assigns all users as @users" do
      get :index
      assigns(:users).should eq([@admin, @user, @dummy])
    end
  end

  describe "GET 'edit'" do
    it "assigns the requested user as @user" do
      get :edit, :id => user.id
      assigns(:user).should eq(user)
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      let(:user_params) { FactoryGirl.attributes_for(:user) }

      it "updates the requested user" do
        user.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => user.id, :user => {'these' => 'params'}
      end

      it "assigns the requested user as @user" do
        put :update, :id => user.id, :user => user_params
        assigns(:user).should eq(user)
      end

      it "redirects to the index" do
        put :update, :id => user.id, :user => user_params
        response.should redirect_to admin_users_path
      end
    end

    describe "with invalid params" do
      it "assigns the user as @user" do
        # Trigger the behavior that occurs when invalid params are submitted
        user.stub(:update_attributes).and_return(false)
        put :update, :id => user.id, :user => {}
        assigns(:user).should eq(user)
      end

      it "re-renders the 'edit' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        user.stub(:update_attributes).and_return(false)
        put :update, :id => user.id, :user => {}
        response.should render_template("edit")
      end
    end
  end

  describe "PUT authorize" do
    describe "with valid params" do
      it "authorizes the user" do
        user.should_receive(:authorize!)
        put :authorize, id: user.id
      end

      it "redirects to the index with a message" do
        put :authorize, id: user.id
        should redirect_to admin_users_path
        flash.notice.should_not be_nil
      end
    end
  end
end
