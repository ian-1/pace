class ConversationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
    @conversations = Conversation.all
    @unread_counts = unread_array_builder
    if params[:format]
      @current_meetup = Meetup.find(params[:format])
    end
  end
  
  def create
    if Conversation.between(params[:sender_id], params[:recipient_id]).present?
       @conversation = Conversation.between(params[:sender_id], params[:recipient_id]).first
    else
       @conversation = Conversation.create!(conversation_params)
    end
    redirect_to conversation_messages_path(@conversation)
  end

  private
  def conversation_params
    params.permit(:sender_id, :recipient_id)
  end

  def unread_array_builder
    unread_messages = []
    conversations = Conversation.all
    conversations.each do |conversation|
      unless current_user.nil?
        if conversation.recipient_id == current_user.id || conversation.sender_id == current_user.id
          if conversation.recipient_id == current_user.id
            other_user_id = conversation.sender_id
          else
            other_user_id = conversation.recipient_id
          end
          unread_counter = 0
          conversation.messages.each do |message|
            unless message.user_id == current_user.id
              if message.read.to_s == '0'
                unread_counter += 1
              end
            end
          end
          unread_messages << { user_id: other_user_id, unread_count: unread_counter }
        end
      end
    end
    unread_messages
  end
end
