class RegistrationsController < Devise::RegistrationsController
  include Devise::Controllers::InternalHelpers

  def update
    self.resource = User.find(current_user)
    user = resource

    if user.update_with_password(params[:user])
      user.unauthorize_and_notify! if user.authorized?
      set_flash_message :notice, :updated if is_navigational_format?
      sign_in :user, user, :bypass => true
      respond_with user, :location => after_update_path_for(resource)
    else
      clean_up_passwords(user)
      respond_with_navigational(user) { render_with_scope :edit }
    end
  end
end 
