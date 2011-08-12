module ControllerMacros
  def login_user
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      user = FactoryGirl.create(:user)
      sign_in user
      assert @controller.instance_variable_set(:"@current_user", true) 
    end
  end
end
