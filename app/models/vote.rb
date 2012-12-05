class Vote < ActiveRecord::Base
  attr_accessible :answer_id, :user_id
  
  def self.add_vote(answer_id, uid)
    vote = Vote.new
    vote.answer_id = answer_id
    vote.user_id = uid
    return vote.save!
  end
  
  def self.delete_vote(answer_id, uid)
    vote = Vote.where(:answer_id => answer_id, :user_id => uid).all
    vote[0].destroy
  end
  
  def self.can_vote(answer_id, uid)
    vote = Vote.where(:answer_id => answer_id, :user_id => uid)
    if vote.size() > 0
      return false
    end
    
    return true
  end
end
