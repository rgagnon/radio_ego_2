require 'spec_helper'

describe "audios/new" do
  before(:each) do
    assign(:audio, stub_model(Audio,
      :title => "MyString"
    ).as_new_record)

    assign(:current_user, stub.as_null_object)
  end

  it "renders new audio form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => audios_path, :method => "post" do
      assert_select "input#audio_title", :name => "audio[title]"
    end
  end
end
