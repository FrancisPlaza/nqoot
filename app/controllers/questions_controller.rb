class QuestionsController < ApplicationController
  def ask
    render :layout => 'dashboard'
  end
  
  def create
    if current_user
      uid = current_user.uid
      slug = Question.add_question(params, uid)
      render :text => 'http://localhost:3000/question/' + slug
    end
  end
  
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
