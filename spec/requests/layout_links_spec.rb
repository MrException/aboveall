require 'spec_helper'

describe "LayoutLinks" do

    it "should have a Home page at '/'" do
        visit '/'
        page.should have_selector('title', :content => "Home")
    end

    it "should have an About page at '/pages/about'" do
        visit '/pages/about'
        page.should have_selector('title', :content => "About")
    end

end
