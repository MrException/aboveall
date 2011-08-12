module RequestMacros
  def capy_login_user
    FactoryGirl.create(:user)
    visit '/'
    click_on 'Login'
    fill_in 'Email', :with => 'user@test.com'
    fill_in 'Password', :with => 'please'
    click_on 'Sign in'
  end
end
