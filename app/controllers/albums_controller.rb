class AlbumsController < ApplicationController
  before_action :set_album, only: [:show, :edit, :update, :destroy]

  # GET /albums
  # GET /albums.json
  def index
    @albums = Album.all
  end

  # GET /albums/1
  # GET /albums/1.json
  def show
  end

  # GET /albums/new
  def new
    @album = Album.new
  end

  # GET /albums/1/edit
  def edit
  end

  # POST /albums
  # POST /albums.json
  def create
    @album = Album.new(params.require(:album).permit(:name, :pic).merge(user_id: current_user.id))

    respond_to do |format|
      if @album.save
        format.html { redirect_to @album, notice: 'Album was successfully created.' }
        format.json { render :show, status: :created, location: @album }
      else
        format.html { render :new }
        format.json { render json: @album.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /albums/1
  # PATCH/PUT /albums/1.json
  def update
    @album.update(params.require(:album).permit(:name, :content, pics:[]).merge(user_id: current_user.id))
    # @album.pics.attach(params[:album][:pics])
    p 'test'
    p @album.pics.all
    p 'test2'
# brew install imagemagick
# sudo apt-get install libmagickwand-dev



    # respond_to do |format|
    #   # if @album.update(params.require(:album).permit(:name, :pic).merge(user_id: current_user.id))
    #     if @album.update(params.require(:album).permit(:name, :content, pics:[]).merge(user_id: current_user.id))
    #
    #     format.html { redirect_to @album, notice: 'Album was successfully updated.' }
    #     p params[:pic]
    #     @album.pics.attach(params[:pics])
    #     format.json { render :show, status: :ok, location: @album }
    #   else
    #     format.html { render :edit }
    #     format.json { render json: @album.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # DELETE /albums/1
  # DELETE /albums/1.json
  def destroy
    @album.destroy
    respond_to do |format|
      format.html { redirect_to albums_url, notice: 'Album was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_album
      @album = Album.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def album_params
      params.require(:album).permit(:name)
    end
end
