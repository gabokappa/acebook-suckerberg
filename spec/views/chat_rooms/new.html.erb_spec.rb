require 'rails_helper'

RSpec.describe "chat_rooms/new", type: :view do
  before(:each) do
    assign(:chat_room, ChatRoom.new())
  end

  it "renders new chat_room form" do
    render

    assert_select "form[action=?][method=?]", chat_rooms_path, "post" do
    end
  end
end
