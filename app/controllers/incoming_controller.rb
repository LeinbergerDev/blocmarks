class IncomingController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]
  skip_before_action :authenticate_user!
  def create
    puts "INCOMING PARAMS HERE: #{params}"

    email = params[:sender]
    puts "#{email}"
    title = params[:subject]
    puts "#{title}"
    body = params["body-plain"]
    puts "#{body}"

    # user = User.find_by email: user
      user = User.find_by(email: email.downcase!)
      if !user 
        puts "user not found Create user"
        user = User.new(email: email.downcase!, password: 'PleaseChangePassword', password_confirmation: 'PleaseChangePassword')
        user.save
        user = User.find_by(email: email.downcase!)
      end
      topic = Topic.find_by(title: title)
      if topic
        puts "topic found"
        bookmark = topic.bookmarks.create(url: body, topic_id: topic.id)
        bookmark.save
        else
        puts "no topic found"
        topic = Topic.create!(title: title, user_id: user.id)
        # topic_object.user_id = user.id
        topic.save
        bookmark = topic.bookmarks.create(url: body, topic_id: topic.id)
        bookmark.save
      end
    head 200
  end
end
