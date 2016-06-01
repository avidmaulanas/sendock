class PlaceImagesController < ApplicationController
  before_action :set_place_image, only: [:show, :edit, :update, :destroy]

  # GET /place_images
  def index
    @place_images = PlaceImage.all
  end

  # GET /place_images/1
  def show
  end

  # GET /place_images/new
  def new
    @place_image = PlaceImage.new
  end

  # GET /place_images/1/edit
  def edit
  end

  # POST /place_images
  def create
    @place_image = PlaceImage.new(place_image_params)

    if @place_image.save
      redirect_to @place_image, notice: 'Place image was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /place_images/1
  def update
    if @place_image.update(place_image_params)
      redirect_to @place_image, notice: 'Place image was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /place_images/1
  def destroy
    @place_image.destroy
    redirect_to place_images_url, notice: 'Place image was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_place_image
      @place_image = PlaceImage.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def place_image_params
      params.require(:place_image).permit(:name, :place_id)
    end
end
