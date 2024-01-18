class ApplicationController < ActionController::Base
    include Pundit::Authorization
    # after_action :verify_authorized, except: :index
    # after_action :verify_policy_scoped, only: :index
    rescue_from Pundit::NotAuthorizedError, with: :pundishing_user

  private

  def pundishing_user
    flash[:notice] = "You are not authorized to perform this action."
    redirect_to articles_url
  end
end
