class VitaeController < ApplicationController
  
  def show
    @vitae = Vitae.includes(:user, :jobs, :schools, :refs).where(code: params[:code]).take
  end
end