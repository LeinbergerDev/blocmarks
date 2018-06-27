class IncomingController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]
  skip_before_action :authenticate_user!
  def create
    puts "INCOMING PARAMS HERE: #{params}"

    user = params[:sender]
    puts "#{user}"
    topic = params[:subject]
    puts "#{topic}"
    body = params["body-plain"]
    puts "#{body}"

    # user_object = User.find_by email: user
      @user = User.find_by(email: user)

      if @user
        @topic = Topic.find_by(title: topic)
        if @topic
          @bookmark = Topic.bookmark.create(url: body, topic_id: @topic.id)
          @topic.save
          else
          @topic = Topic.new(title: topic)
          @topic.user_id = @user.id
          @topic.save
          @bookmark = @topic.bookmark.create(url: body, topic_id: @topic.id)
          @bookmark.save
        end
        
      end

    head 200
  end
end
