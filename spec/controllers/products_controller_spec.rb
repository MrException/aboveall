require 'spec_helper'

describe ProductsController do
  login_admin

  let(:product) { mock_model(Product).as_null_object }
  let(:products) { [product] }

  before do
    Product.stub(:find).and_return(product)
      # this seems to be the only way to stub out the :all method with CanCan
    ActiveRecord::Relation.any_instance.stub(:joins).and_return(products)
  end

  describe "GET index" do
    it "assigns all products as @products" do
      get :index
      assigns(:products).should eq products
    end
  end

  describe "GET show" do
    it "assigns the requested product as @product" do
      get :show, :id => product.id
      assigns(:product).should eq(product)
    end
  end

  describe "GET new" do
    it "assigns a new product as @product" do
      get :new
      assigns(:product).should be_a_new(Product)
    end
  end

  describe "GET edit" do
    it "assigns the requested product as @product" do
      get :edit, :id => product.id
      assigns(:product).should eq(product)
    end
  end

  describe "POST create" do
    let(:product_params) { FactoryGirl.attributes_for(:product) }

    describe "with valid params" do
      it "creates a new Product" do

        expect {
          post :create, :product => product_params
        }.to change(Product, :count).by(1)
      end

      it "assigns a newly created product as @product" do
        post :create, :product => product_params
        assigns(:product).should be_a(Product)
        assigns(:product).should be_persisted
      end

      it "redirects to the created product" do
        post :create, :product => product_params
        response.should redirect_to(Product.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved product as @product" do
        # Trigger the behavior that occurs when invalid params are submitted
        Product.any_instance.stub(:save).and_return(false)
        post :create, :product => {}
        assigns(:product).should be_a_new(Product)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Product.any_instance.stub(:save).and_return(false)
        post :create, :product => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      let(:product_params) { product.attributes }

      it "updates the requested product" do
        product.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => product.id, :product => {'these' => 'params'}
      end

      it "assigns the requested product as @product" do
        put :update, :id => product.id, :product => product_params
        assigns(:product).should eq(product)
      end

      it "redirects to the product" do
        put :update, :id => product.id, :product => product_params
        response.should redirect_to(product)
      end
    end

    describe "with invalid params" do
      it "assigns the product as @product" do
        # Trigger the behavior that occurs when invalid params are submitted
        product.stub(:update_attributes).and_return(false)
        put :update, :id => product.id, :product => {}
        assigns(:product).should eq(product)
      end

      it "re-renders the 'edit' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        product.stub(:update_attributes).and_return(false)
        put :update, :id => product.id, :product => {}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested product" do
      product.should_receive(:destroy).and_return true
      delete :destroy, :id => product.id
    end

    it "redirects to the products list" do
      delete :destroy, :id => product.id
      response.should redirect_to(products_url)
    end
  end

end
