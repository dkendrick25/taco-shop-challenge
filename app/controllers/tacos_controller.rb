class TacosController < ApplicationController
   skip_before_action :verify_authenticity_token
  def index
    @tacos = Taco.all
    render json: @tacos, status: :ok
  end
  
  def create
    @taco = Taco.new(taco_params)
    if @taco.save
      render json: @taco, status: :created
    else
      render json: { errors: @taco.errors.full_messages }, status: :unprocessable_entity
    end
  end
  
  def destroy
    @taco = Taco.find(params[:id])
    if @taco.destroy
      render json: {}, status: :ok
    end
  end
  
  private
  
  def taco_params
    params.require(:taco).permit(
      :meat,
      :rice,
      :salsa,
      :beans,
      :notes
    )
  end
end