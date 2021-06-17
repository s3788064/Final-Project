class QuestionsController < ApplicationController
  before_action :set_question, only: %i[ show edit update destroy ]
  before_action :set_random

  def question1
    @question = @random[0]
    session[:answered].clear()
  end

  def question2
    @question = @random[1]
  end

  def question3
    @question = @random[2]
  end

  def question4
    @question = @random[3]
  end

  def results
    session[:attempts] ||=[]

    @correct = 0;
    @total = session[:answered].length()
    @questionsanswered = session[:answered]

    @questionsanswered.each do |check|
      if check[1].eql?(true)
        @correct += 1
      end
    end

    @previousattempts = session[:attempts]

    time = Time.now
    time = time.strftime("%H:%M %d-%m-%Y")

    session[:attempts].push(time, @correct)

  end

  def answer
    session[:answered] ||= []

    @question = Question.all.find_by(:question_id => params[:qid])
    @answer = params[:singleAnswer]

    if(@answer.eql?("answer_a") && @question.answer_a_correct.eql?("true"))
      result = true
    elsif(@answer.eql?("answer_b") && @question.answer_b_correct.eql?("true"))
      result = true
    elsif(@answer.eql?("answer_c") && @question.answer_c_correct.eql?("true"))
      result = true
    elsif(@answer.eql?("answer_d") && @question.answer_d_correct.eql?("true"))
      result = true
    elsif(@answer.eql?("answer_e") && @question.answer_e_correct.eql?("true"))
      result = true
    elsif(@answer.eql?("answer_f") && @question.answer_f_correct.eql?("true"))
      result = true
    else
      result = false
    end

    session[:answered].push([params[:qid], result])

    if(session[:answered].length() == 1)
      redirect_to '/question2'
    elsif(session[:answered].length() == 2)
      redirect_to '/question3'
    elsif(session[:answered].length() == 3)
      redirect_to '/question4'
    else
      redirect_to '/results'
    end
  end

  # GET /questions or /questions.json
  def index
    @questions = Question.all
  end

  # GET /questions/1 or /questions/1.json
  def show
  end

  # GET /questions/new
  def new
    @question = Question.new
  end

  # GET /questions/1/edit
  def edit
  end

  # POST /questions or /questions.json
  def create
    @question = Question.new(question_params)

    respond_to do |format|
      if @question.save
        format.html { redirect_to @question, notice: "Question was successfully created." }
        format.json { render :show, status: :created, location: @question }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /questions/1 or /questions/1.json
  def update
    respond_to do |format|
      if @question.update(question_params)
        format.html { redirect_to @question, notice: "Question was successfully updated." }
        format.json { render :show, status: :ok, location: @question }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questions/1 or /questions/1.json
  def destroy
    @question.destroy
    respond_to do |format|
      format.html { redirect_to questions_url, notice: "Question was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def question_params
      params.require(:question).permit(:question_id)
    end

    def set_random
      @random = Question.all.shuffle
    end

end
