class Jobs::EvaluationsController < ApplicationController
  before_action :set_jobs_evaluation, only: [:show, :edit, :update, :destroy]

  # GET /jobs/evaluations
  # GET /jobs/evaluations.json
  def index
    @jobs_evaluations = Jobs::Evaluation.all
  end

  # GET /jobs/evaluations/1
  # GET /jobs/evaluations/1.json
  def show
  end

  # GET /jobs/evaluations/new
  def new
    @jobs_evaluation = Jobs::Evaluation.new
  end

  # GET /jobs/evaluations/1/edit
  def edit
  end

  # POST /jobs/evaluations
  # POST /jobs/evaluations.json
  def create
    @jobs_evaluation = Jobs::Evaluation.new(jobs_evaluation_params)

    respond_to do |format|
      if @jobs_evaluation.save
        format.html { redirect_to @jobs_evaluation, notice: 'Evaluation was successfully created.' }
        format.json { render :show, status: :created, location: @jobs_evaluation }
      else
        format.html { render :new }
        format.json { render json: @jobs_evaluation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /jobs/evaluations/1
  # PATCH/PUT /jobs/evaluations/1.json
  def update
    respond_to do |format|
      if @jobs_evaluation.update(jobs_evaluation_params)
        format.html { redirect_to @jobs_evaluation, notice: 'Evaluation was successfully updated.' }
        format.json { render :show, status: :ok, location: @jobs_evaluation }
      else
        format.html { render :edit }
        format.json { render json: @jobs_evaluation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /jobs/evaluations/1
  # DELETE /jobs/evaluations/1.json
  def destroy
    @jobs_evaluation.destroy
    respond_to do |format|
      format.html { redirect_to jobs_evaluations_url, notice: 'Evaluation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_jobs_evaluation
      @jobs_evaluation = Jobs::Evaluation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def jobs_evaluation_params
      params.require(:jobs_evaluation).permit(:comment, :star, :user_id)
    end
end
