require 'spec_helper'

describe "Products" do
  describe "tab navigation" do
    it "can not be seen when not logged in" do
      visit '/'
      find('#tab-nav').should_not have_content 'Products'
    end

    it "can be seen when logged in" do
      capy_login_user
      find('#tab-nav').should have_content 'Products'
    end
  end

  describe "list page" do
  end
end
