class UsersController < ApplicationController
  def index
  end
  
  def add_staff
    user = User.find_by_uid(params[:uid])
    if user
      user.is_staff = true
      user.save!
    end
    redirect_to root_url
  end
end
