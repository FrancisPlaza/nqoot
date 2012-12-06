class Answer < ActiveRecord::Base
  attr_accessible :anonimity, :answer, :question_id, :user_id
  belongs_to :question
  
  # Creates new answer to a given question
  # specified by question_id.
  #
  # A user is associated to a specific answer
  # through the given uid. Only add answer
  # if user exists, return false otherwise.
  def self.add_answer(params, uid)
    user = User.where(:uid => uid).all
    if user.size() > 0
      answer = Answer.new
      answer.answer = params[:answer]
      answer.anonimity = params[:anonimity]
      answer.question_id = params[:question_id]
      answer.user_id = uid
      answer.vote = 0
      answer.is_staff_endorsed = false
      return answer.save!
    end
    
    return false
  end
end
