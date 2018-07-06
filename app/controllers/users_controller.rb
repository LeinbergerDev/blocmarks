class UsersController < ApplicationController
  def show
    @user_topics = Topic.where(user_id: current_user.id)
    @liked_bookmarks = Like.where(user_id: current_user.id)

    @topics = Topic.all
    @liked_topics = []
    @topics.each do |topic|
      topic.bookmarks.each do |bookmark|
        if current_user.liked(bookmark)
          unless @liked_topics.include?(topic)
            @liked_topics << topic
          end
        end
      end
    end
  end
end
