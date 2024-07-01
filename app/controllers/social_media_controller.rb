class SocialMediaController < ApplicationController
  before_action :set_social_medium, only: %i[ show update destroy ]

  # GET /social_media
  def index
    @social_media = SocialMedium.all

    render json: @social_media
  end

  # GET /social_media/1
  def show
    render json: @social_medium
  end

  # POST /social_media
  def create
    @social_medium = SocialMedium.new(social_medium_params)

    if @social_medium.save
      render json: @social_medium, status: :created, location: @social_medium
    else
      render json: @social_medium.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /social_media/1
  def update
    if @social_medium.update(social_medium_params)
      render json: @social_medium
    else
      render json: @social_medium.errors, status: :unprocessable_entity
    end
  end

  # DELETE /social_media/1
  def destroy
    @social_medium.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_social_medium
      @social_medium = SocialMedium.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def social_medium_params
      params.permit(:platform, :url, :user_id)
    end
end
