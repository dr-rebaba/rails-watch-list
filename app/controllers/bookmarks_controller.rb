class BookmarksController < ApplicationController
  before_action :find_list, only: [:new, :create]
  before_action :find_bookmark, only: [:destroy]

  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = @list.bookmarks.new(bookmark_params)

    if @bookmark.save
      redirect_to @list, notice: 'Bookmark created.'
    else
      render :new
    end
  end

  def show
    @bookmark = Bookmark.find(params[:id])
  end

  def destroy
    @bookmark.destroy
    redirect_to @bookmark.list, notice: 'Bookmark deleted.'
  end

  private

  def find_list
    @list = List.find(params[:list_id])
  end

  def find_bookmark
    @bookmark = Bookmark.find(params[:id])
  end

  def bookmark_params
    params.require(:bookmark).permit(:movie_id, :comments)
  end
end
