class Api::WordsController < ApplicationController
  before_action :set_word, only: [:show, :update, :destroy]

  # GET /words
  # GET /words.json
  def index
    if params[:study_case].present?
      @words = Word.where(kind: 0, study_case_id: params[:study_case], user_id: current_user.id).order(created_at: :desc).page params[:page]
      @problems = Word.where(kind: 1, study_case_id: params[:study_case], user_id: current_user.id).order(created_at: :desc).page params[:page]
      @brainstorms = Word.where(kind: 2, study_case_id: params[:study_case], user_id: current_user.id).order(created_at: :desc).page params[:page]
      @solutions = Word.where(kind: 3, study_case_id: params[:study_case], user_id: current_user.id).order(created_at: :desc).page params[:page]
      @diagnostics = Word.where(kind: 4, study_case_id: params[:study_case], user_id: current_user.id).order(created_at: :desc).page params[:page]
      @knows = Word.where(kind: 5, study_case_id: params[:study_case], user_id: current_user.id).order(created_at: :desc).page params[:page]
      @knowledges = Word.where(kind: 6, study_case_id: params[:study_case], user_id: current_user.id).order(created_at: :desc).page params[:page]
    else
      @words = Word.order(created_at: :desc).page params[:page]
    end
  end

  # GET /words/1
  # GET /words/1.json
  def show
  end

  # POST /words
  # POST /words.json
  def create
    @word = Word.new(word_params)
    @word.user_id = current_user.id
    if @word.save!
      render :show, status: :created
    else
      render json: @word.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /words/1
  # PATCH/PUT /words/1.json
  def update
    if @word.update(word_params)
      render :show, status: :ok
    else
      render json: @word.errors, status: :unprocessable_entity
    end
  end

  # DELETE /words/1
  # DELETE /words/1.json
  def destroy
    @word.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_word
      @word = Word.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def word_params
      params.require(:word).permit!
    end
end
