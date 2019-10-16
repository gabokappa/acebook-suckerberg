require 'rails_helper'

RSpec.describe "chat_rooms/show", type: :view do
  before(:each) do
    @chat_room = assign(:chat_room, ChatRoom.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
