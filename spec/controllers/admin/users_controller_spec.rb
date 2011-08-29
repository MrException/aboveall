require 'spec_helper'

describe Admin::UsersController do
  login_admin

  describe "GET 'index'" do
    it "should be successful" do
      get 'index'
      response.should be_success
    end

    it "assigns all users as @users" do
      user = FactoryGirl.create(:dummy_user)
      get :index
      assigns(:users).should eq([@admin, user])
    end
  end

  describe "GET 'edit'" do
    it "assigns the requested product as @product" do
      user = FactoryGirl.create(:user)
      get :edit, :id => user.id.to_s
      assigns(:user).should eq(user)
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      let(:user_params) { FactoryGirl.attributes_for(:user) }

      it "updates the requested user" do
        user = FactoryGirl.create(:user)
        # Assuming there are no other users in the database, this
        # specifies that the User created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        User.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => user.id, :user => {'these' => 'params'}
      end

      it "assigns the requested user as @user" do
        user = FactoryGirl.create(:user)
        put :update, :id => user.id, :user => user_params
        assigns(:user).should eq(user)
      end

      it "redirects to the index" do
        user = FactoryGirl.create(:user)
        put :update, :id => user.id, :user => user_params
        response.should redirect_to admin_users_path
      end
    end

    describe "with invalid params" do
      it "assigns the user as @user" do
        user = FactoryGirl.create(:user)
        # Trigger the behavior that occurs when invalid params are submitted
        User.any_instance.stub(:save).and_return(false)
        put :update, :id => user.id.to_s, :user => {}
        assigns(:user).should eq(user)
      end

      it "re-renders the 'edit' template" do
        user = FactoryGirl.create(:user)
        # Trigger the behavior that occurs when invalid params are submitted
        User.any_instance.stub(:save).and_return(false)
        put :update, :id => user.id.to_s, :user => {}
        response.should render_template("edit")
      end
    end
  end
end
