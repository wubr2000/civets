class SiteController < ApplicationController
  before_action :is_authenticated?
  
  def index
  end
end