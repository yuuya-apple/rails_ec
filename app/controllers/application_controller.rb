# frozen_string_literal: true

class ApplicationController < ActionController::Base

  helper_method:current_user
  before_action :current_user

  private

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def admin_require
    redirect_to(root_url) unless @current_user.is_admin?
  end

end
