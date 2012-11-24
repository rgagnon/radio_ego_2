require 'spec_helper'

describe "audios/edit" do
  before(:each) do
    @audio = assign(:audio, stub_model(Audio, :title => "MyString"))
  end

  it "renders the edit audio form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => audios_path(@audio), :method => "post" do
      assert_select "input#audio_title", :name => "audio[title]"
    end
  end
end
