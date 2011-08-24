module ControllerMacros
  def login_user
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      @admin = FactoryGirl.create(:admin)
      sign_in @admin
    end
  end
end
