require 'test_helper'

class VoteTest < ActiveSupport::TestCase
  test "should add vote" do
    user = User.new
    user.uid = '1000'
    user.save!
    
    answer = Answer.new
    answer.save!
    
    assert Vote.add_vote(answer.id, user.uid)
  end
  
  test "should not add vote for invalid answer" do
    user = User.new
    user.uid = '1000'
    user.save!
    
    assert !Vote.add_vote(2, user.uid)
  end
  
  test "should not add vote for invalid user" do
    answer = Answer.new
    answer.save!
    
    assert !Vote.add_vote(answer.id, '1001')
  end

  test "should not add vote for invalid user and answer" do
    assert !Vote.add_vote(2, '1001')
  end
  
  test "should delete vote" do
    user = User.new
    user.uid = '1000'
    user.save!
    
    answer = Answer.new
    answer.save!
    
    vote = Vote.new(:answer_id => answer.id, :user_id => user.uid)
    vote.save!
    
    assert Vote.delete_vote(answer.id, user.uid)
  end
  
  test "should not delete no vote" do
    assert !Vote.delete_vote(2, '1001')
  end
  
  test "should allow user to vote" do
    user = User.new
    user.uid = '1000'
    user.save!
    
    answer = Answer.new
    answer.save!
    
    assert Vote.can_vote(answer.id, user.uid)
  end
  
  test "should not allow user to vote" do
    user = User.new
    user.uid = '1000'
    user.save!
    
    answer = Answer.new
    answer.save!
    
    Vote.add_vote(answer.id, user.uid)
    
    assert !Vote.can_vote(answer.id, user.uid)
  end
end
