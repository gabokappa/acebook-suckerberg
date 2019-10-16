require 'rails_helper'

RSpec.describe "chat_rooms/edit", type: :view do
  before(:each) do
    @chat_room = assign(:chat_room, ChatRoom.create!())
  end

  it "renders the edit chat_room form" do
    render

    assert_select "form[action=?][method=?]", chat_room_path(@chat_room), "post" do
    end
  end
end
