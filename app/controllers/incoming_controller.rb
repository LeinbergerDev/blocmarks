class IncomingController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]

  def create
    puts "INCOMING PARAMS HERE: #{params}"

    user = params[:user]
    puts "#{user}"
    topic = params[:subject]
    puts "#{topic}"
    body = params["body-plain"]
    puts "#{body}"

    # user_object = User.find_by email: user

    # if !user_object

    # topic_object = Topic.find_by title: topic

    # if topic_object 
    #   @bookmark = Topic.bookmark.create(url: body)
    # else
    #   @topic = Topic.new(title: topic)
    #   @topic.user_id = user_object.id
    #   @bookmark = @topic.bookmark.create(url: body)
    # end

    head 200
  end
end
