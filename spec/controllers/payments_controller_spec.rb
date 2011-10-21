require 'spec_helper'

describe PaymentsController do
  login_user

  let(:payment) { mock_model(Payment) }

  before :each do
    Payment.stub(:find).and_return(payment)
  end


  describe "PUT update" do
    context "successful" do
      it "updates the payment" do
        payment.should_receive(:update_attributes).with({ 'nonsense' => 'params' })
        put :update, :id => payment.id, :payment => { 'nonsense' => 'params' }
      end

      it "redirects to the order view" do
        payment.stub(:update_attributes).and_return true
        put :update, :id => payment.id 
        should redirect_to new_order_path
      end
    end

    context "failure" do
      it "redirects to the order when save fails" do
        payment.stub(:update_attributes).and_return false
        put :update, :id => payment.id 
        should redirect_to new_order_path
        flash.alert.should_not be_nil
      end
    end

  end

end
