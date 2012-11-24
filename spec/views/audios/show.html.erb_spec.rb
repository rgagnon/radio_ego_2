require 'spec_helper'

describe "audios/show" do
  before(:each) do
    @audio = assign(:audio, stub_model(Audio,
      :title => "Title"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
  end
end
