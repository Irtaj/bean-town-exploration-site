class Api::V1::ReviewsController < ApplicationController
protect_from_forgery unless: -> { request.format.json? }

  def index
    render json: Review.where(place_id: params[:id])
  end

  def create
    @review = Review.new(title: review_params[:title], body: review_params[:body], rating: review_params[:rating], place_id: review_params[:place_id], user_id: current_user.id)
    if @review.save!
      flash[:notice] = "Place added successfully"
      render json: @review

    else
      flash[:notice] = @review.errors.full_messages.join(", ")
    end
  end

  private

  def review_params
    params.require(:review).permit(:title, :body, :rating, :place_id)
  end
end
