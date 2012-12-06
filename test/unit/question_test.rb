require 'test_helper'

class QuestionTest < ActiveSupport::TestCase
  test "should add question with valid uid" do
    user = User.new
    user.uid = '1000'
    user.save!
    
    params = { :question => 'This is a question.',
               :description => 'This is a description.',
               :anonimity => false,
               :slug => 'this-is-a-question' }
    assert Question.add_question(params, '1000')
  end
  
  test "should not add question with invalid uid" do
    params = { :question => 'This is a question.',
               :description => 'This is a description.',
               :anonimity => false,
               :slug => 'this-is-a-question' }
    assert !Question.add_question(params, 'invalid_uid')
  end

end
