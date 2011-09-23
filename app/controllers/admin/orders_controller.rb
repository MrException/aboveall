class Admin::OrdersController < SecureController
  before_filter :authenticate_user!
  load_and_authorize_resource

  def index
  end

  def edit
  end

  def update
    if @order.update_attributes(params[:order])
      redirect_to action: 'index'
    else
      redirect_to action: 'edit'
    end
  end
end
