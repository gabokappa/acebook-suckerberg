class ChatRoomsController < ApplicationController
  before_action :set_chat_room, only: [:show, :edit, :update, :destroy]

  # GET /chat_rooms
  # GET /chat_rooms.json
  def index
    @chat_rooms = ChatRoom.all
  end

  # GET /chat_rooms/1
  # GET /chat_rooms/1.json
  def show
    @chat_room = ChatRoom.includes(:messages).find_by(id: params[:id])
  end

  # GET /chat_rooms/new
  def new
    @chat_room = ChatRoom.new
  end

  # GET /chat_rooms/1/edit
  def edit
  end

  # POST /chat_rooms
  # POST /chat_rooms.json
  def create
    @chat_room = current_user.chat_rooms.build(chat_room_params)

    # respond_to do |format|
    if @chat_room.save
      flash[:success] = 'Chat room added!'
      redirect_to chat_rooms_path
    else
      render 'new'
    end
  end

  # PATCH/PUT /chat_rooms/1
  # PATCH/PUT /chat_rooms/1.json
  def update
    respond_to do |format|
      if @chat_room.update(chat_room_params)
        format.html { redirect_to @chat_room, notice: 'Chat room was successfully updated.' }
        format.json { render :show, status: :ok, location: @chat_room }
      else
        format.html { render :edit }
        format.json { render json: @chat_room.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /chat_rooms/1
  # DELETE /chat_rooms/1.json
  def destroy
    @chat_room.destroy
    respond_to do |format|
      format.html { redirect_to chat_rooms_url, notice: 'Chat room was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_chat_room
    @chat_room = ChatRoom.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def chat_room_params
    params.require(:chat_room).permit(:title)
  end
end
