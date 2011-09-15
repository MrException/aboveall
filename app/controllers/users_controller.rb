class UsersController < SecureController
  before_filter :authenticate_user!
  load_and_authorize_resource
end
