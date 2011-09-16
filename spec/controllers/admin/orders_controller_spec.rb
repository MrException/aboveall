require 'spec_helper'

describe Admin::OrdersController do
  login_admin

  let(:order) { mock_model(Order).as_null_object }
  let(:orders) do
    o = []
    5.times do
      o << mock_model(Order)
    end
    o
  end

  before do
    Order.stub(:find).and_return(order)
    Order.stub(:all).and_return(orders)
    # this seems to be the only way to stub out the :all method with CanCan
    ActiveRecord::Relation.any_instance.stub(:joins).and_return(orders)
  end

  describe "GET 'index'" do
    it "should be successful" do
      get 'index'
      response.should be_success
    end

    it "assigns all users as @users" do
      get :index
      assigns(:orders).should eq(orders)
    end
  end

  #describe "GET 'edit'" do
    #it "assigns the requested user as @user" do
      #get :edit, :id => user.id
      #assigns(:user).should eq(user)
    #end
  #end

  #describe "PUT update" do
    #describe "with valid params" do
      #let(:user_params) { FactoryGirl.attributes_for(:user) }

      #it "updates the requested user" do
        #user.should_receive(:update_attributes).with({'these' => 'params'})
        #put :update, :id => user.id, :user => {'these' => 'params'}
      #end

      #it "assigns the requested user as @user" do
        #put :update, :id => user.id, :user => user_params
        #assigns(:user).should eq(user)
      #end

      #it "redirects to the index" do
        #put :update, :id => user.id, :user => user_params
        #response.should redirect_to admin_users_path
      #end
    #end

    #describe "with invalid params" do
      #it "assigns the user as @user" do
        ## Trigger the behavior that occurs when invalid params are submitted
        #user.stub(:update_attributes).and_return(false)
        #put :update, :id => user.id, :user => {}
        #assigns(:user).should eq(user)
      #end

      #it "re-renders the 'edit' template" do
        ## Trigger the behavior that occurs when invalid params are submitted
        #user.stub(:update_attributes).and_return(false)
        #put :update, :id => user.id, :user => {}
        #response.should render_template("edit")
      #end
    #end
  #end
end
