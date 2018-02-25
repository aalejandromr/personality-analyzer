class PersonalityAnalyzesController < ApplicationController
  before_action :set_personality_analyze, only: [:show, :edit, :update, :destroy]

  # GET /personality_analyzes
  # GET /personality_analyzes.json
  def index
    @personality_analyzes = PersonalityAnalyze.all
  end

  # GET /personality_analyzes/1
  # GET /personality_analyzes/1.json
  def show
  end

  # GET /personality_analyzes/new
  def new
    @personality_analyze = PersonalityAnalyze.new
  end

  # GET /personality_analyzes/1/edit
  def edit
  end

  # POST /personality_analyzes
  # POST /personality_analyzes.json
  def self.create
    @personality_analyze = PersonalityAnalyze.new(personality_analyze_params)
      if @personality_analyze.save
        return true
      else
        return false
      end
  end

  # PATCH/PUT /personality_analyzes/1
  # PATCH/PUT /personality_analyzes/1.json
  def update
    respond_to do |format|
      if @personality_analyze.update(personality_analyze_params)
        format.html { redirect_to @personality_analyze, notice: 'Personality analyze was successfully updated.' }
        format.json { render :show, status: :ok, location: @personality_analyze }
      else
        format.html { render :edit }
        format.json { render json: @personality_analyze.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /personality_analyzes/1
  # DELETE /personality_analyzes/1.json
  def destroy
    @personality_analyze.destroy
    respond_to do |format|
      format.html { redirect_to personality_analyzes_url, notice: 'Personality analyze was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_personality_analyze
      @personality_analyze = PersonalityAnalyze.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def personality_analyze_params
      params.require(:personality_analyze).permit(:user_id, :user_data)
    end
end
