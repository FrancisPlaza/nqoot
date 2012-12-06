class QuestionsController < ApplicationController
  
  # Renders the ask view with layout
  # of the dashboard.
  def ask
    render :layout => 'dashboard'
  end
  
  # Given a uid, creates a questions associated
  # to that user of a given uid. Responds with
  # the url of the question, which the javascript
  # redirects the client to.
  def create
    # Configure this when local or production
    # hostname = 'localhost:3000'
    hostname = 'nqoot.francis.ph'
    
    if current_user
      uid = current_user.uid
      Question.add_question(params, uid)
      render :text => 'http://' + hostname + '/question/' + params[:slug]
    else
      redirect_to root_url
    end
  end
  
  # This method finds a question given a slug.
  # Renders the question as well as recent questions
  # sorted by date created.
  def display
    @question = Question.find_by_slug(params[:slug])
    if @question
      @user = User.find_by_uid(@question.user_id)
      @recent_questions = Question.all(:order => 'created_at DESC', :limit => 10)
      render :layout => 'dashboard'
    else
      redirect_to root_url
    end
  end
end
