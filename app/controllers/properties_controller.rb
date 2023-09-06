class PropertiesController < ApplicationController
  before_action :set_property, only: %i[ show update destroy ]
  before_action :authorize_property, only: [:update, :destroy]

  # GET /properties
  def index
    @properties = Property.all

    render json: @properties
  end

  # GET /properties/1
  def show
    render json: @property
  end

  # POST /properties
  def create
    @property = Property.new(property_params)

    if @property.save
      render json: @property, status: :created, location: @property
    else
      render json: @property.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /properties/1
  def update
    if @property.update(property_params)
      render json: @property
    else
      render json: @property.errors, status: :unprocessable_entity
    end
  end

  # DELETE /properties/1
  def destroy
    @property.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_property
      @property = Property.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def property_params
      params.require(:property).permit(:title, :description, :price, :image, :city, :zip_code, :created_at)
    end

    def authorize_property
      #Vérifier si l'utilisateur actuel est autorisé à effectuer l'action
      unless curent_user.admin? || current_user == @property.user
        render json: {error: "Vous n'êtes pas autorisé à effectuer cette action." }, status: :forbidden
      end
        
    end
end
