class PagesController < ApplicationController

  def home
    @title = "Home"
    @users = User.all
  end

  def about
    @title = "About"
  end

end
