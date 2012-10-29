class Question < ActiveRecord::Base
  attr_accessible :anonimity, :description, :question, :user_id
  has_many :answer
  
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
