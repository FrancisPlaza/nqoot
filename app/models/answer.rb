class Answer < ActiveRecord::Base
  attr_accessible :anonimity, :answer, :question_id, :user_id
  belongs_to :question
  
  def self.add_answer(params, uid)
    answer = Answer.new
    answer.answer = params[:answer]
    answer.anonimity = params[:anonimity]
    answer.question_id = params[:question_id]
    answer.user_id = uid
    answer.vote = 0
    answer.is_staff_endorsed = false
    answer.save!
    return answer
  end
end
