class ApplicationController < ActionController::API
    rescue_from ActiveRecord::RecordInvalid, with: :show_errors

    private
    def show_errors(e)
        render json: { success: false, message: e.record.errors.full_messages }, status: :bad_request
    end
end
