class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def my_page
    @user = current_user
  end

  def profile
    @user = current_user
  end

  def my_posts
    @pets = Pet.where(user: current_user)
    @user = current_user
  end

  
end
