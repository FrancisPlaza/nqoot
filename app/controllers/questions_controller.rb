class QuestionsController < ApplicationController
  def ask
    render :layout => 'dashboard', :template => 'pages/ask'
  end
  
  def create
    if current_user
      uid = current_user.uid
      question = Question.add_question(params, uid)
      render :nothing => true
    end
  end
end
