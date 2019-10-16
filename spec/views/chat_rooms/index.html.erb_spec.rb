require 'rails_helper'

RSpec.describe "chat_rooms/index", type: :view do
  before(:each) do
    assign(:chat_rooms, [
      ChatRoom.create!(),
      ChatRoom.create!()
    ])
  end

  it "renders a list of chat_rooms" do
    render
  end
end
