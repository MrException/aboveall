module RequestMacros
  def capy_login_user
    FactoryGirl.create(:user)
    visit root_path
    click_on 'Login'
    fill_in 'Email', :with => 'user@test.com'
    fill_in 'Password', :with => 'please'
    click_on 'Sign in'
  end
  def capy_login_admin
    FactoryGirl.create(:admin)
    visit root_path
    click_on 'Login'
    fill_in 'Email', :with => 'admin@test.com'
    fill_in 'Password', :with => 'please'
    click_on 'Sign in'
  end
end
