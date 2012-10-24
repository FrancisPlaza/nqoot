class QuestionsController < ApplicationController
  def ask
    render :layout => 'dashboard', :template => 'pages/ask'
  end
end
