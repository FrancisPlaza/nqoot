class AnswersController < ApplicationController
  def create
    if current_user
      Answer.add_answer(params, current_user.uid)
    end
  end
  
  def delete
    answer = Answer.find_by_id(params[:id])
    if answer.user_id == current_user.uid
      answer.destroy
      render :nothing => true
    end
  end
  
  def vote
    if current_user
      answer = Answer.find_by_id(params[:answer_id])
      answer.vote += 1
      answer.save!
    end
    redirect_to :back
  end
  
  def endorse
    if current_user.is_staff
      answer = Answer.find_by_id(params[:answer_id])
      answer.is_staff_endorsed = true
      answer.save!
    end
    redirect_to :back
  end
  
  def unendorse
    if current_user.is_staff
      answer = Answer.find_by_id(params[:answer_id])
      answer.is_staff_endorsed = false
      answer.save!
    end
    redirect_to :back
  end
  
  def show
    if current_user
      @question = Question.find_by_id(params[:question_id])
      if @question    
        @answers = Answer.where(:question_id => @question.id).order('vote DESC').all
        render :layout => false
      else
        render :nothing => true
      end
    else
      render :nothing => true
    end
  end
  
end
