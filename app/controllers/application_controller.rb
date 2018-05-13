class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :get_user
  helper_method :no_users?

  def no_users?
    User.all.count == 0
  end

  def not_found
    logger.error "404 Not Found"
    render template: "errors/404", status: :not_found
  end

  def render_not_found(exception)
    logger.error "404 Not Found"
    logger.error exception
    render template: "errors/404", status: 404 unless @not_found
  end

  def render_error(exception)
    logger.error "500 Internal Server Error"
    logger.error exception
    render template: "errors/500", status: 500 unless @not_found
  end

  def render_unauthorized
    render text: "Unauthorized", status: :unauthorized
  end

private

  def get_user
    @user = current_user || User.new
  end
end
