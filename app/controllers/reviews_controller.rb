class ReviewsController < ApplicationController
  def create
    @review = Review.new(review_params)

    respond_to do |format|
      if Assign.find_by(user_id: @review.user_id, job_id: @review.job_id) != nil &&
         current_user.jobs.find(@review.job_id) != nil &&
         @review.save
        p "おけ"
        p @review
        format.html { redirect_to @review.job, notice: 'Review was successfully created.' }
        format.json { render :show, status: :created, location: @review }
      else
        format.html { redirect_back fallback_location: root_path }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = Review.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def review_params
      params.require(:review).permit(:job_id, :user_id, :rating, :comment)
    end
end
