class ApplicationController < ActionController::API
    rescue_from ActiveRecord::RecordInvalid, with: :show_errors
    rescue_from ActiveRecord::RecordNotFound, with: :show_not_found
    rescue_from ActionController::ParameterMissing, with: :params_missing

    private
    def params_missing(e)
        render json: { success: false, message: e.to_s }, status: :bad_request
    end

    def show_errors(e)
        render json: { success: false, message: e.record.errors.full_messages }, status: :bad_request
    end

    def show_not_found(e)
        render json: { success: false, message: e.to_s }, status: :not_found
    end
end
