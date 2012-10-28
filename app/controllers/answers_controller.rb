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
        :timestamp => answer.created_at.in_time_zone('Eastern Time (US & Canada)').strftime('%A, %B %d, %Y at %I:%M %p %Z')
      }
    end
  end
end
