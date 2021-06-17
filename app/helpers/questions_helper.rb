module QuestionsHelper

  @controllertext = 1
  @random = Question.all.shuffle
  @question1 = @random[0]
  @question2 = @random[1]
  @question3 = @random[2]
  @question4 = @random[3]


  def randomise
    @random = Question.all.shuffle
  end

  def set_quiz
    @question1 = @random[0]
    @question2 = @random[1]
    @question3 = @random[2]
    @question4 = @random[3]
  end


end
