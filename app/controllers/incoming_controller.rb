class IncomingController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]
  skip_before_action :authenticate_user!
  def create
    puts "INCOMING PARAMS HERE: #{params}"

    user = params[:user]
    puts "#{user}"
    topic = params[:subject]
    puts "#{topic}"
    body = params["body-plain"]
    puts "#{body}"

    # user_object = User.find_by email: user
      @user = User.find_by(email: params[:user])

      # if @user
      #   @topic = Topic.find_by(title: topic)
      #   @topic.user_id = @user.id
      #   if @topic
      #     @bookmark = Topic.bookmark.create(url: body, @topic.id)
      #     @topic.save
      #     else
      #     @topic = Topic.new(title: topic)
      #     @bookmark = @topic.bookmark.create(url: body, @topic.id)
      #   end
        
      # end

    head 200
  end
end
