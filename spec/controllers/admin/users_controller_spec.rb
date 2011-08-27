require 'spec_helper'

describe Admin::UsersController do
  login_admin

  describe "PUT 'authorize'" do
    it "updates a users role from 'unauthorized' to 'authorized'"
  end

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
    end

  end


      #it "assigns the requested product as @product" do
        #product = FactoryGirl.create(:product)
        #put :update, :id => product.id, :product => product_params
        #assigns(:product).should eq(product)
      #end

      #it "redirects to the product" do
        #product = FactoryGirl.create(:product)
        #put :update, :id => product.id, :product => product_params
        #response.should redirect_to(product)
      #end
    #end

    #describe "with invalid params" do
      #it "assigns the product as @product" do
        #product = FactoryGirl.create(:product)
        ## Trigger the behavior that occurs when invalid params are submitted
        #Product.any_instance.stub(:save).and_return(false)
        #put :update, :id => product.id.to_s, :product => {}
        #assigns(:product).should eq(product)
      #end

      #it "re-renders the 'edit' template" do
        #product = FactoryGirl.create(:product)
        ## Trigger the behavior that occurs when invalid params are submitted
        #Product.any_instance.stub(:save).and_return(false)
        #put :update, :id => product.id.to_s, :product => {}
        #response.should render_template("edit")
      #end
    #end
  #end
  
end
