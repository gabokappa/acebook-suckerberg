class AlbumsController < ApplicationController
  before_action :set_album, only: [:show, :edit, :update, :destroy]

  def index
    @albums = Album.all
  end

  def show
  end

  def new
    @album = Album.new
  end

  def edit
    if !album_authored_by_user?(@album.id)
      flash[:notice] = 'ERROR: only the owner of the album can edit the Album'
      redirect_to '/'
    end
  end

  def create
    @album = Album.new(params.require(:album).permit(:name, :pic).merge(user_id: current_user.id))

    respond_to do |format|
      if @album.save
        format.html { redirect_to '/', notice: 'Album was successfully created.' }
        format.json { render :show, status: :created, location: @album }
      else
        format.html { render :new }
        format.json { render json: @album.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if album_authored_by_user?(@album.id)
      @album.update(params.require(:album).permit(:name, :content, pics:[]).merge(user_id: current_user.id))
      p '--- did update ----'
    else
      flash[:notice] = 'ERROR: only the owner of the album can edit the Album'
    end
    redirect_to '/'
  end

  def destroy
    if album_authored_by_user?(params[:id])
      @album.destroy
      respond_to do |format|
        format.html { redirect_to '/', notice: 'Album was successfully destroyed.' }
        format.json { head :no_content }
      end
    else
      flash[:notice] = 'ERROR: only the owner of the album can delete the Album'
      redirect_to '/'
    end
  end

  def destroy_pic
    if album_authored_by_user?(params[:album_id])
    @album = Album.find(params[:album_id])
    @album.pics.find(params[:pic_id]).destroy
  else
    flash[:notice] = 'ERROR: only the owner of the album can delete the Picture'
  end
  redirect_to '/'
end

  def album_authored_by_user?(params_id)
    @album = Album.find_by(id: params_id)
    p "------------- #{@album.user_id} -----------------"
    p "------------- #{current_user.id} -----------------"
    current_user.id == @album.user_id ? true : false
  end

  private
    def set_album
      @album = Album.find(params[:id])
    end

    def album_params
      params.require(:album).permit(:name)
    end
end

# brew install imagemagick
# sudo apt-get install libmagickwand-dev
