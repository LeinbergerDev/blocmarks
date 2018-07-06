class LikesController < ApplicationController
  def index

  end

  def create
    @bookmark = Bookmark.find(params[:bookmark_id])
    like = current_user.likes.build(bookmark: @bookmark)
    if like.save
      flash[:notice] = "This bookmark has been added to your likes"
      redirect_to topics_path
    else
      flash[:alert] = "An error prevented this bookmark from being liked."
      redirect_to topics_path
    end
  end

    def destroy
      @bookmark = Bookmark.find(params[:bookmark_id])
      like = Like.find_by user_id: current_user.id, bookmark_id: @bookmark.id

      if like.destroy
        flash[:notice] = "You no longer like this bookmark."
        redirect_to topics_path
      else
        flash[:alert] = "An error prevented this bookmark from being unliked."
        redirect_to topics_path
      end
  end
end
