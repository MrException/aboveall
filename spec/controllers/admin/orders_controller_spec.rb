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
    # this seems to be the only way to stub out #all with CanCan
    ActiveRecord::Relation.any_instance.stub(:joins).and_return(orders)
  end

  describe "GET 'index'" do
    it "should be successful" do
      get "index"
      response.should be_success
    end

    it "assigns all orders as @orders" do
      get :index
      assigns(:orders).should eq(orders)
    end
  end

  describe "GET 'edit'" do
    it "assigns the requested order as @order" do
      get :edit, :id => order.id
      assigns(:order).should eq(order)
    end
  end

  describe "PUT update" do
    context "with valid params" do
      before { order.stub(:update_attributes).and_return(true) }

      it "updates the requested order" do
        order.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => order.id, :order => {'these' => 'params'}
      end

      it "redirects to the index" do
        put :update, :id => order.id
        response.should redirect_to admin_orders_path
      end
    end

    context "with invalid params" do
      before { order.stub(:update_attributes).and_return(false) }

      it "assigns the order as @order" do
        # Trigger the behavior that occurs when invalid params are submitted
        put :update, :id => order.id, :order => {}
        assigns(:order).should eq(order)
      end

      it "re-renders the 'edit' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        put :update, :id => order.id, :order => {}
        should redirect_to action: 'edit'
      end
    end
  end
end
