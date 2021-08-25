require "application_responder"

class ApplicationController < ActionController::Base
  self.responder = ApplicationResponder
  respond_to :html

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :nav
  before_action :set_website_config
  def nav
    @nav = ArticleCategory.where(is_nav: true)
  end
  def set_website_config
    @setting = Setting.first
  end
end
