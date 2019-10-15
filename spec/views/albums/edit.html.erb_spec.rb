require 'rails_helper'

RSpec.describe "albums/edit", type: :view do
  before(:each) do
    @album = assign(:album, Album.create!(
      :name => "MyText",
      :user => FactoryBot.create(:user)
    ))
  end

  it "renders the edit album form" do
    render

    assert_select "form[action=?][method=?]", album_path(@album), "post" do

      # assert_select "text_field[name=?]", "album[name]"
    end
  end
end
