# frozen_string_literal: true

class ApplicationController < ActionController::Base
  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == 'admin' && password == 'pw'
    end
  end
end
