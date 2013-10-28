class Api::BaseController < ApplicationController

  layout false
  respond_to :json

  def render_not_logged
    return render json: { success: false, message: "Error with your login or password" }, status: 401
  end

  def render_unauthorized
    return render json: { success: false, message: "You don't have access to this resource" }, status: 401
  end

  def render_unprocessable(message = "Error in your data")
    return render json: { success: false, message: message }, status: 422
  end

  def render_not_found
    return render json: { success: false, message: "Resource not found" }, status: 404
  end

  def render_created
    return render json: { success: true }, status: 201
  end

  def render_success
    return render json: { success: true }, status: 200
  end

protected

private

end
