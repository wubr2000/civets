class JobsController < ApplicationController
  before_action :is_authenticated?
  before_action :get_jobs
  before_action :set_csrf_token_header, only: [ :index, :show ]
  
  respond_to :json
  
  def index
  end
  
  def show
  end
  
  def create
    @job = @user.jobs.create(job_params)
    
    if @job.save
      head :created, location: job_url(@user, @job)
    else
      render 'errors', status: :unprocessable_entity
    end
  end
  
  def update
    if @job.update(job_params)
      head :no_content
    else
      render 'errors', status: :unprocessable_entity
    end
  end
  
  def destroy
    head( @job.destroy ? :no_content : :method_not_allowed )
  end
  
  private
  
  def get_jobs
    if (params[:vitae_id])
      head :bad_request unless @vitae = current_user.vitaes.find_by_id( params[:vitae_id] )
    end
    
    @jobs = @vitae ? @vitae.jobs : current_user.jobs
    
    if (params[:id])
      head :not_found unless @job = @jobs.find_by_id( params[:id] )
    end
  end
  
  def job_params
    params.require(:job).permit(
      :company,
      :location,
      :title,
      :hired_on,
      :left_on,
      :responsibilities
    )
  end
end