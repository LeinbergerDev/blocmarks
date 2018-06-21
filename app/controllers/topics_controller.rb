class TopicsController < ApplicationController
  def index
    @topics = Topic.all
    @bookmarks = Bookmark.all
  end

  def show
    @topic = Topic.find(params[:id])
    @bookmarks = Bookmark.where("topic_id = #{@topic.id}")
  end

  def new
    @topic = Topic.new
  end

  def create 
    @topic = Topic.new(topic_params)
    @topic.user_id = current_user.id
    if @topic.save
      flash[:notice] = "Topic was saved."
      redirect_to @topic
    else
      # flash.now[:alert] = "An error prevented the topic from being saved"
      render :new
    end
  end


  def edit
    @topic = Topic.find(params[:id])
  end

  def update
    @topic = Topic.find(params[:id])
    if @topic.update_attributes(topic_params)
      flash[:notice] = "Topic was updated"
      redirect_to topics_path
    else
      flash.now[:alert] = "An error prevented the topic from being updated."
      render :edit
    end
  end

  def destroy
    @topic = Topic.find(params[:id])

    if @topic.destroy
      flash[:notice] = "Topic was deleted"
      redirect_to topics_path
    else
      flash.now[:alert] = "An error prevented the topic from being saved"
      render :index
    end
  end

  private

  def topic_params
    params.require(:topic).permit(:title)
  end

end
