class Admin::OrdersController < SecureController
  before_filter :authenticate_user!
  load_and_authorize_resource

  def index
  end
end
