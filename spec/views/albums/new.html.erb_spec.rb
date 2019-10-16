# frozen_string_literal: true
require 'rails_helper'

RSpec.describe 'albums/new', type: :view do
  before(:each) do
    assign(:album, Album.new(
      name: 'MyText'
    ))
  end

  it 'renders new album form' do
    render

    assert_select 'form[action=?][method=?]', albums_path, 'post' do

      assert_select 'textarea[name=?]', 'album[name]'
    end
  end
end
