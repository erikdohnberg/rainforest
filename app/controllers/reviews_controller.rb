class ReviewsController < ApplicationController
  before_filter :load_product

  def index
    @reviews = Review.all
  end

  def show
    @review = Review.find(params[:id])

  end

  # POST /product/:id/reviews
  def create
    @review = @product.reviews.build(
      :comment => params[:review][:comment], 
      :user_id => current_user.id
    )

    if @review.save
      redirect_to @product, notice: 'Review was successfully created.'
    else
      render "products/show"
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to reviews_url
  end

  def load_product
    @product = Product.find(params[:product_id])
  end
end