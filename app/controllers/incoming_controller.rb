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
      user_object = User.find_by(email: user.downcase!)
      if !user_object
        user_object = User.create!(email: user.downcase!, password: 'PleaseChangePassword')
      end
      topic_object = Topic.find_by(title: topic)
      if topic_object
        puts "topic found"
        bookmark = topic_object.bookmarks.create(url: body, topic_id: topic_object.id)
        bookmark.save
        else
        puts "no topic found"
        topic_object = Topic.create!(title: topic, user_id: user_object.id)
        # topic_object.user_id = user_object.id
        topic_object.save
        bookmark = topic_object.bookmarks.create(url: body, topic_id: topic_object.id)
        bookmark.save
      end
    head 200
  end
end
