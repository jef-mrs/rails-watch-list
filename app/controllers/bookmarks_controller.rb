class BookmarksController < ApplicationController

  def create
    @list = List.find(params[:list_id])
    # @movie = Movie.find(params[:movie_id])
    @bookmark = Bookmark.new(bookmarks_params)
    # @bookmark.movie = @movie
    @bookmark.list = @list

    if @bookmark.save
      redirect_to list_path(@list)
    else
      render :new
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy

    redirect_to list_path(@bookmark.list)
  end

  private

  def bookmarks_params
    params.require(:bookmark).permit(:comment, :movie_id, :list_id)
  end
end
