class SessionsController < ApplicationController
  
  # Renders homepage of the user. Displays
  # all the question associated to the user.
  def home
    if current_user
      @questions = Question.where(:user_id => current_user.uid).all
      @recent_questions = Question.all(:order => 'created_at DESC', :limit => 10)
      render :layout => 'dashboard', :template => 'pages/index'
    end
  end
  
  # Creates a new session when a user has
  # authenticated using a Facebook account.
  def create
    user = User.from_omniauth(env['omniauth.auth'])
    session[:user_id] = user.id
    redirect_to root_url
  end
  
  # Destroys a current session, called during
  # logout of the user.
  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end
  
end
