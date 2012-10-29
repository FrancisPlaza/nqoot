class Vote < ActiveRecord::Base
  attr_accessible :answer_id, :user_id
  
  def self.add_vote(params, uid)
    vote = Vote.new
    vote.answer_id = params[:answer_id]
    vote.user_id = current_user.id
    vote.save!
  end
end
