require 'spec_helper'

describe RegistrationsController do
  before :each do
    request.env["devise.mapping"] = Devise.mappings[:user]
  end

  describe "PUT update" do
    login_user

    let(:user) { controller.current_user.attributes }

    it "redirects to root path when password supplied" do
      user[:current_password] = 'please'
      put :update, user: user
      should redirect_to root_path
    end

    it "redirects to edit path when no password supplied" do
      put :update, user: user
      should render_template "edit"
    end
  end
end
