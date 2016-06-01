class PlaceCommentsController < ApplicationController
  before_action :set_place
  before_action :set_place_comment, only: [:show, :edit, :update, :destroy]

  # GET /place_comments
  def index
    @place_comments = @place.place_comments.all
  end

  # GET /place_comments/1
  def show
  end

  # GET /place_comments/new
  def new
    @place_comment = @place.place_comments.new
  end

  # GET /place_comments/1/edit
  def edit
  end

  # POST /place_comments
  def create
    @place_comment = @place.place_comments.new(place_comment_params)
    @place_comment.user_id = current_user.id

    if @place_comment.save
      redirect_to place_place_comments_url(@place), notice: 'Place comment was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /place_comments/1
  def update
    if @place_comment.update(place_comment_params)
      redirect_to place_place_comments_url(@place), notice: 'Place comment was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /place_comments/1
  def destroy
    @place_comment.destroy
    redirect_to place_place_comments_url, notice: 'Place comment was successfully destroyed.'
  end

  private
    def set_place
      @place = Place.find(params[:place_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_place_comment
      @place_comment = @place.place_comments.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def place_comment_params
      params.require(:place_comment).permit(:place_id, :user_id, :content)
    end
end
