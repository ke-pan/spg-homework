class UpdatesController < ApplicationController
  before_action :find_mentions
  
  def index
    friend_emails = sender.friends.pluck(:email)
    subscriber_emails = sender.subscribers.pluck(:email)
    blocker_emails = sender.blockers.pluck(:email)
    render json: { success: true, recipients: (friend_emails | subscriber_emails | @mentions) - blocker_emails }
  end

  private 
  def sender_params
    params.require(:sender)
  end

  def text_params
    params.fetch(:text, '')
  end

  def sender
    User.find_by!(email: sender_params)
  end

  def find_mentions
    if text_params.is_a? String
      @mentions ||= text_params.scan(/\b[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\b/i)
    else
      render json: {success: false, message: ':text must be string'}, status: :bad_request
    end
  end
end
