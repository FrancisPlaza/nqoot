class UsersController < ApplicationController
  def index
  end
  
  # Method to create a staff given a user uid.
  # Sets is_staff boolean to true.
  def add_staff
    user = User.find_by_uid(params[:uid])
    if user
      user.is_staff = true
      user.save!
    end
    redirect_to root_url
  end
end
