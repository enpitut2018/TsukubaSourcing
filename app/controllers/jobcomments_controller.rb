class JobcommentsController < ApplicationController
  before_action :set_jobcomment, only: [:show, :edit, :update, :destroy]

  # GET /jobcomments
  # GET /jobcomments.json
  def index
    @jobcomments = Jobcomment.all
  end

  # GET /jobcomments/1
  # GET /jobcomments/1.json
  def show
  end

  # GET /jobcomments/new
  def new
    @jobcomment = Jobcomment.new
  end

  # GET /jobcomments/1/edit
  def edit
  end

  # POST /jobcomments
  # POST /jobcomments.json
  def create
    @jobcomment = Jobcomment.new(jobcomment_params)

    respond_to do |format|
      if @jobcomment.save
        format.html { redirect_to @jobcomment, notice: 'Jobcomment was successfully created.' }
        format.json { render :show, status: :created, location: @jobcomment }
      else
        format.html { render :new }
        format.json { render json: @jobcomment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /jobcomments/1
  # PATCH/PUT /jobcomments/1.json
  def update
    respond_to do |format|
      if @jobcomment.update(jobcomment_params)
        format.html { redirect_to @jobcomment, notice: 'Jobcomment was successfully updated.' }
        format.json { render :show, status: :ok, location: @jobcomment }
      else
        format.html { render :edit }
        format.json { render json: @jobcomment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /jobcomments/1
  # DELETE /jobcomments/1.json
  def destroy
    @jobcomment.destroy
    respond_to do |format|
      format.html { redirect_to jobcomments_url, notice: 'Jobcomment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_jobcomment
      @jobcomment = Jobcomment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def jobcomment_params
      params.require(:jobcomment).permit(:comment, :star, :user_id)
    end
end
