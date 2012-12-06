class Vote < ActiveRecord::Base
  attr_accessible :answer_id, :user_id
  
  # Creates a vote given an answer_id
  # and uid. A vote is an association
  # between an answer and user.
  def self.add_vote(answer_id, uid)
    answer = Answer.where(:id => answer_id).all
    user = User.where(:uid => uid).all
    
    if answer.size() > 0 and user.size() > 0
      vote = Vote.new
      vote.answer_id = answer_id
      vote.user_id = uid
      return vote.save!
    end
  
    return false
  end
  
  # Deletes a vote given an answer_id
  # and uid. Called when user down_votes.
  def self.delete_vote(answer_id, uid)
    vote = Vote.where(:answer_id => answer_id, :user_id => uid).all
    
    if vote.size() > 0
      vote[0].destroy
      return true
    end
    
    return false
  end
  
  # Returns a boolean specifying if a user
  # given a uid can vote a certain answer.
  def self.can_vote(answer_id, uid)
    vote = Vote.where(:answer_id => answer_id, :user_id => uid)
    
    if vote.size() > 0
      return false
    end
    
    return true
  end
end
