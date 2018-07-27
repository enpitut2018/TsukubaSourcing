class JobsController < ApplicationController
  before_action :set_job, only: [:chat, :worker_list, :create_message, :show, :edit, :update, :destroy]

  # GET /jobs
  # GET /jobs.json
  def index
    @jobs = Job.all
    @users = User.all
  end

  # GET /jobs/1
  # GET /jobs/1.json
  def show
    @employer = @job.user
    @chat_list = user_signed_in? ? select_chats(current_user.id, @employer) : nil
    @comments = @job.comments
  end

  # GET /jobs/new
  def new
    if not user_signed_in?
      redirect_to :action => "index"
    end
    @job = Job.new
  end

  # GET /jobs/1/edit
  def edit
    if not user_signed_in? or current_user.id != @job.user_id
      redirect_to :action => "index"
    end
  end

  # POST /jobs
  # POST /jobs.json
  def create
    @job = Job.new(job_params)

    if user_signed_in? and current_user.id == @job.user_id
      respond_to do |format|
        if @job.save
          format.html { redirect_to @job, notice: 'Job was successfully created.' }
          format.json { render :show, status: :created, location: @job }
        else
          format.html { render :new }
          format.json { render json: @job.errors, status: :unprocessable_entity }
        end
      end
    else
      respond_to do |format|
        format.html { redirect_to jobs_url, notice: 'Job was unsuccessfully created. You don\'t have the permission to create it.' }
        format.json { head :no_content }
      end
    end
  end

  # PATCH/PUT /jobs/1
  # PATCH/PUT /jobs/1.json
  def update
    if user_signed_in? and current_user.id == @job.user_id
      respond_to do |format|
        if @job.update(job_params)
          format.html { redirect_to @job, notice: 'Job was successfully updated.' }
          format.json { render :show, status: :ok, location: @job }
        else
          format.html { render :edit }
          format.json { render json: @job.errors, status: :unprocessable_entity }
        end
      end
    else
      respond_to do |format|
        format.html { redirect_to jobs_url, notice: 'Job was unsuccessfully updated. You don\'t have the permission to update it.' }
        format.json { head :no_content }
      end
    end
  end

  # DELETE /jobs/1
  # DELETE /jobs/1.json
  def destroy
    if user_signed_in? and current_user.id == @job.user_id
      @job.destroy
      respond_to do |format|
        format.html { redirect_to jobs_url, notice: 'Job was successfully destroyed.' }
        format.json { head :no_content }
      end
    else
      respond_to do |format|
        format.html { redirect_to jobs_url, notice: 'Job was unsuccessfully destroyed. You don\'t have the permission to delete it.' }
        format.json { head :no_content }
      end
    end
  end
  def create_comment
    pp = params.permit(:message, :user_id, :job_id)
    pp[:visible] = true
    Comment.create(pp)
    redirect_back fallback_location: root_path

  end

  def create_message
    pp = params.permit(:message, :from_id , :to_id)
    pp[:job_id] = @job.id
    Chat.create(pp)
    redirect_back fallback_location: root_path
  end

  def worker_list
    p Chat.where(to_id: current_user.id, job_id: @job.id)
    result= Chat.where(to_id: current_user.id, job_id: @job.id).select(:from_id).uniq
    hoge=[];
    result.each do |e|
      hoge.push(e.from_id)
    end

    @workers = User.find(hoge)
  end

  def chat
    @worker_id = params.require(:worker_id)
    @chat_list = select_chats(current_user.id, @worker_id)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job
      @job = Job.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def job_params
      params.require(:job).permit(:title, :user_id, :description)
    end

    def select_chats(user1, user2)
      p Chat.first
      @chat_list = @job.chats
      @chat_list = @chat_list.where(from_id: user1,to_id: user2).or(@chat_list.where(from_id: user2,to_id: user1))
      @chat_list.reorder("created_at")
    end
end
