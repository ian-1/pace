# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :profile_pic
  validates :first_name, :postcode, :dob, :gender, :ability, :goals, :profile_pic, presence: true

  def self.search(params)
    where("LOWER(first_name) LIKE :term OR LOWER(postcode) LIKE :term OR LOWER(gender) LIKE :term
      OR LOWER(ability) LIKE :term OR LOWER(goals) LIKE :term", term: "%#{params}%")
  end

  def self.unread_counter(current_user)
    unread_messages = 0
    conversations = Conversation.all
    conversations.each do |conversation|
      unless current_user.nil?
        if conversation.recipient_id == current_user.id || conversation.sender_id == current_user.id
          conversation.messages.each do |message|
            unless message.user_id == current_user.id
              if message.read.to_s == '0'
                unread_messages += 1
              end
            end
          end
        end
      end
    end
    unread_messages
  end


  has_many :endorsements

  has_many :reports

  has_many :meetups

end
