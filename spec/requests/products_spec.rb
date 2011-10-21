require 'spec_helper'

describe "Products" do
  describe "tab navigation" do
    it "can not be seen when not logged in" do
      visit root_path
      find('#navigation').should have_no_content 'Products'
    end

    it "can be seen when logged in" do
      capy_login_user
      visit root_path
      find('#navigation').should have_content 'Products'
    end
  end

  describe "list page" do
    before(:each) do
      FactoryGirl.create(:product)
    end

    it "has a list of products" do
      capy_login_user
      visit root_path
      click_on 'Products'
      find('#products-list').should have_content 'Product Name'
    end

    it "does not have create link when viewed by normal user" do
      capy_login_user
      visit root_path
      click_on 'Products'
      find('#products-list').should have_no_content 'Create A New Product'
    end

    it "does have create link when viewed by admin" do
      capy_login_admin
      visit root_path
      click_on 'Products'
      find('#products-list').should have_content 'Create A New Product'
    end
  end

  describe "description page" do
    before(:each) do
      FactoryGirl.create(:product)
    end

    it "still has the products list" do
      capy_login_user
      visit root_path
      click_on 'Products'
      find('#products-list').click_on 'Product Image'
      find('#products-list').should have_content 'Product Name'
    end

    it "does not have edit link when viewed by a normal user" do
      capy_login_user
      click_on 'Products'
      find('#products-list').click_on 'Product Image'
      find('#product-description').should have_no_link 'Edit'
    end

    it "does have edit link when viewed by a admin user" do
      capy_login_admin
      click_on 'Products'
      find('#products-list').click_on 'Product Image'
      find('#product-description').should have_link 'Edit'
    end
  end

  describe "creation page" do
    before(:each) do
      capy_login_admin
    end

    let(:image) { File.join(::Rails.root, 'spec/test_image.jpg')}

    it "should create with valid data" do
      visit root_path
      click_on "Products"
      click_on 'Create A New Product'
      fill_in "Title", :with => "A Title"
      fill_in "Description", :with => "A Description"
      fill_in "Short description", :with => "A Short Description"
      fill_in "Price", :with => "1000000.00"
      attach_file "Image", image
      click_on "Create Product"
      page.should_not have_selector "div#error_explanation"
      page.should have_content "successfully created"
    end

  end

  describe "edit page" do
    before(:each) do
      capy_login_admin
      FactoryGirl.create(:product)
    end

    it "should save with valid data" do
      visit root_path
      click_on 'Products'
      find('#products-list').click_on 'Product Image'
      click_on 'Edit'
      fill_in "Title", :with => "A Title"
      fill_in "Description", :with => "A Description"
      fill_in "Short description", :with => "A Short Description"
      fill_in "Price", :with => "1000000.00"
      click_on "Update Product"
      page.should_not have_selector "div#error_explanation"
      page.should have_content "successfully updated"
    end
  end
end
