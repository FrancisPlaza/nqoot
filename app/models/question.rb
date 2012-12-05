class Question < ActiveRecord::Base
  attr_accessible :anonimity, :description, :question, :user_id
  has_many :answer
  
  # Creates new question. A question is associated to a
  # user through the given uid.
  #
  # @return the slug of the question. This is used
  # later to redirect the user to the question page.
  def self.add_question(params, uid)
    question = Question.new
    question.question = params[:question]
    question.description = params[:description]
    question.anonimity = params[:anonimity]
    question.slug = params[:slug]
    question.user_id = uid
    question.save!
    return question.slug
  end
end
