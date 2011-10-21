class PaymentsController < SecureController
  def update
    if @payment.update_attributes(params[:payment])
      redirect_to new_order_path, notice: 'Payment method successfully changed.' 
    else
      redirect_to new_order_path, alert: "Couldn't save your payment method!"
    end
  end
end
