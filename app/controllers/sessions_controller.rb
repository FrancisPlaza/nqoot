class SessionsController < ApplicationController
  
  def home
    if current_user
      @questions = Question.where(:user_id => current_user.uid).all
      @recent_questions = Question.all(:order => 'created_at DESC', :limit => 10)
      render :layout => 'dashboard', :template => 'pages/index'
    end
  end
  
  def create
    user = User.from_omniauth(env['omniauth.auth'])
    session[:user_id] = user.id
    redirect_to root_url
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end
  
end
