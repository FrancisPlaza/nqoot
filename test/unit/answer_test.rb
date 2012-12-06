require 'test_helper'

class AnswerTest < ActiveSupport::TestCase
  test "should add answer with valid uid" do
    user = User.new
    user.uid = '1000'
    user.save!
    
    params = { :answer => 'This is an answer.',
               :anonimity => false,
               :question_id => 1 }
    assert Answer.add_answer(params, '1000')
  end
  
  test "should not add answer with invalid uid" do
    params = { :answer => 'This is an answer.',
               :anonimity => false,
               :question_id => 1 }
    assert !Answer.add_answer(params, 'invalid_uid')
  end
end
