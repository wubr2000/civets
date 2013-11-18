class RefsController < ApplicationController
  before_action :is_authenticated?
  before_action :get_refs
  before_action :set_csrf_token_header, only: [ :index, :show ]
  
  respond_to :json
  
  def index
  end
  
  def show
  end
  
  def create
    @ref = current_user.refs.create(ref_params)
    
    if @ref.save
      head :created, location: ref_url(@user, @ref)
    else
      render 'errors', status: :unprocessable_entity
    end
  end
  
  def update
    if @ref.update(ref_params)
      head :no_content
    else
      render 'errors', status: :unprocessable_entity
    end
  end
  
  def destroy
    head( @ref.destroy ? :no_content : :method_not_allowed )
  end
  
  private
  
  def get_refs
    if (params[:vitae_id])
      head :bad_request unless @vitae = current_user.vitaes.find_by_id( params[:vitae_id] )
    end
    
    @refs = @vitae ? @vitae.refs : current_user.refs
    
    if (params[:id])
      head :not_found unless @ref = @refs.find_by_id( params[:id] )
    end
  end
  
  def ref_params
    params.require(:ref).permit(
      :name,
      :title,
      :email,
      :phone,
      :relationship
    )
  end
end