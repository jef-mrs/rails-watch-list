class ReviewsController < ApplicationController

  def create
    @bookmark = Bookmark.new
    @list = List.find(params[:list_id])
    @review = Review.new(reviews_params)
    @review.list = @list

    if @review.save
      redirect_to list_path(@list)
    else
      render 'lists/show'
    end
  end

  private

  def reviews_params
    params.require(:review).permit(:comment, :rating, :list_id)
  end
end
