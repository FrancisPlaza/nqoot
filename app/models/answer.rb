class Answer < ActiveRecord::Base
  attr_accessible :anonimity, :answer, :question_id, :user_id
  
  def self.add_answer(params, uid)
    answer = Answer.new
    answer.answer = params[:answer]
    answer.anonimity = params[:anonimity]
    answer.question_id = params[:question_id]
    answer.user_id = uid
    answer.save!
    return answer
  end
end
