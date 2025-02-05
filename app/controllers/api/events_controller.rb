class Api::EventsController < ApplicationController
  skip_before_action :verify_authenticity_token # Needed for testing POST requests without CSRF tokens

  #Rails.logger.info "📡 Received Event: #{params}"

  def create
    event = {
      app_id: params[:appId],
      session_id: params[:sessionId],
      event_type: params[:type],
      target: params[:target],
      value: params[:value],
      timestamp: params[:timestamp]
    }

    Rails.logger.info "📡 LISTEN EVENT: #{event}"

    render json: { status: "success", received: event }, status: :ok
  end
end

