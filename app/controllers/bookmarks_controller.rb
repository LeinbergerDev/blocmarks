class BookmarksController < ApplicationController
  def show
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @bookmark = @topic.bookmarks.build

  end

  def create
    @topic = Topic.find(params[:topic_id])
    @bookmark = @topic.bookmarks.create(bookmark_params);

    if @bookmark.save 
      flash[:notice] = 'Bookmark was saved.'
      redirect_to @topic
    else
      flash.now[:alert] = 'An error prevented the bookmark from being saved.'
      render :new
    end
  end

  def update
    @topic = Topic.find(params[:topic_id])
    @bookmark = @topic.bookmarks.find(params[:id])

    if @bookmark.update_attributes(bookmark_params)
      flash[:notice] = 'Bookmark was updated.'
      redirect_to @topic
      else
      flash.now[:alert] = 'An error prevented the bookmark from being updated.'
      render :edit
    end
  end

  def edit
    @topic = Topic.find(params[:topic_id])
    @bookmark = @topic.bookmarks.find(params[:id])
  end

  def destroy
    @topic = Topic.find(params[:topic_id])
    @bookmark = @topic.bookmarks.find(params[:id])
    if @bookmark.destroy
      flash[:notice] = 'Bookmark was deleted'
      redirect_to @topic
    else
      flash.now[:alert] = "An error prevented the bookmark from being deleted."
      redirect_to @topic
    end
  end

  private
  
  def bookmark_params
    params.require(:bookmark).permit(:url, :topic_id)
  end
  
end
