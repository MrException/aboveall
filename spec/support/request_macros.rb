module RequestMacros
  def capy_login_new
    dummy = FactoryGirl.create(:dummy_user)
    visit root_path
    click_on 'Login'
    fill_in 'Email', :with => dummy.email
    fill_in 'Password', :with => 'please'
    click_on 'Sign in'
  end
  def capy_login_user
    user = FactoryGirl.create(:user)
    visit root_path
    click_on 'Login'
    fill_in 'Email', :with => user.email
    fill_in 'Password', :with => 'please'
    click_on 'Sign in'
  end
  def capy_login_admin
    admin = FactoryGirl.create(:admin)
    visit root_path
    click_on 'Login'
    fill_in 'Email', :with => admin.email
    fill_in 'Password', :with => 'please'
    click_on 'Sign in'
  end
end
