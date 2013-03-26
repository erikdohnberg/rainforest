class ReviewsController < ApplicationController

  def index
    @reviews = Review.all
  end

  def show
    @review = Review.find(params[:id])

  end

  def create
    @review = Review.new(params[:review])

    if @review.save
      redirect_to @review, notice: 'Review was successfully created.'
    else
      render action: "new"
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy

    respond_to do |format|
      format.html { redirect_to reviews_url }
      format.json { head :no_content }
    end
  end
end