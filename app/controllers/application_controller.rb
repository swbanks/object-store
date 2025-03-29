class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session

  include Pundit
  before_action :set_current_user

  private
  def set_current_user
    @current_user = User.find_by(id: "ed59c782-ab65-4371-abd5-0b6a340e62d4")
    # token = request.headers['Authorization']&.split(' ')&.last
    # if token
    #   decoded_token = JWT.decode(token, ENV['DEVISE_JWT_SECRET_KEY'], true, algorithm: 'HS256')
    #   @current_user = User.find_by(id: decoded_token[0]['sub'])
    # end
  end

  def current_user
    @current_user
  end
end
