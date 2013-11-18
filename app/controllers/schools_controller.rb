class SchoolsController < ApplicationController
  before_action :is_authenticated?
  before_action :get_schools
  before_action :set_csrf_token_header, only: [ :index, :show ]
  
  respond_to :json
  
  def index
  end
  
  def show
  end
  
  def create
    @school = @schools.create(school_params)
    
    if @school.save
      head :created, location: school_url(@school)
    else
      render 'errors', status: :unprocessable_entity
    end
  end
  
  def update
    if @school.update(school_params)
      head :no_content
    else
      render 'errors', status: :unprocessable_entity
    end
  end
  
  def destroy
    head( @school.destroy ? :no_content : :method_not_allowed )
  end
  
  private
  
  def get_schools
    if (params[:vitae_id])
      head :bad_request unless @vitae = current_user.vitaes.find_by_id( params[:vitae_id] )
    end
    
    @schools = @vitae ? @vitae.schools : current_user.schools
    
    if (params[:id])
      head :not_found unless @school = @schools.find_by_id( params[:id] )
    end
  end
  
  def school_params
    params.require(:school).permit(
      :name,
      :location,
      :major,
      :enrolled_on,
      :left_on,
      :did_graduate
    )
  end
end