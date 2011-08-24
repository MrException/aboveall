require 'spec_helper'

describe Admin::UsersController do
  login_user

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

end
