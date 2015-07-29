class HivesController < ApplicationController
  before_action :current_user, only: [:index, :show, :chat, :new]

  require 'pusher'

  Pusher.app_id = ENV['PUSHER_APP_ID']
  Pusher.key = ENV['PUSHER_KEY']
  Pusher.secret = ENV['PUSHER_SECRET']
  Pusher.host = "api.pusherapp.com"


  def index
    @group_hives = Hive.where(id: HiveUser.where(user_id: @current_user.id).pluck(:hive_id)).where(solo: false)
    @solo_hives = Hive.where(id: HiveUser.where(user_id: @current_user.id).pluck(:hive_id)).where(solo: true)
    @potential_hives = Hive.where(solo: false).sample(3)
  end

  def show
    @current_hive = Hive.find_by(id: params[:id])
    @hive_users = HiveUser.where(hive_id: @current_hive.id)
    hive_messages = Message.where(hive_id: @current_hive.id)
    gon.mapped_messages = hive_messages.map do |message|
      message.getMessage
    end
  end

  # Loading screen to tell the user what is happening
  def new
    gon.current_user = @current_user
  end

  # Taken from Pusher
  def chat
    @current_hive = Hive.find_by(id: params[:hive_id])

    chat_info = params[:chat_info]

    channel_name = nil

    if !request.referer
      status 400
      body 'channel name could not be determined from request.referer'
    end

    channel_name = get_channel_name(request.referer)
    options = sanitise_input(chat_info)

    message = Message.create(user_id: @current_user.id, hive_id: @current_hive.id, body: options['text'])

    data = message.getMessage

    response = Pusher.trigger(channel_name, 'chat_message', data)

    if request.xhr?
     render json: {activity: data, pusherResponse: response}
    end
end






def get_channel_name(http_referer)
  pattern = /(\W)+/
  channel_name = http_referer.gsub pattern, '-'
  return channel_name
end

def sanitise_input(chat_info)
  options = {}
  options['displayName'] = @current_user.name
  options['text'] = chat_info['text'].slice(0, 300)
  options['image'] = @current_user.image_url
  return options
end

end
