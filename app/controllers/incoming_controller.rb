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
    head 200
  end
end
