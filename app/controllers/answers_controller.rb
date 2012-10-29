class AnswersController < ApplicationController
  def create
    if current_user
      uid = current_user.uid
      answer = Answer.add_answer(params, uid)
      user_name = current_user.name
      if answer.anonimity
        user_name = 'Anonymous'
      end
      render :json => {
        :user => user_name,
        :answer => answer.answer,
        :timestamp => answer.created_at.in_time_zone('Eastern Time (US & Canada)').strftime('%A, %B %d, %Y at %I:%M %p %Z'),
        :answer_id => answer.id
      }
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
    vote = Vote.where(:user_id => current_user.uid, :answer_id => params[:answer_id]).all
    if vote.length == 0
      vote.add_vote(params, current_user.uid)
    end
  end
  
end
