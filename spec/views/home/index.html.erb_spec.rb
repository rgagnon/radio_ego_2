#encoding:utf-8
require 'spec_helper'

describe "home/index.html.erb" do

  it 'devait afficher une section des plus écoutés' do
    title = 'Some title I made up'
    assign(:most_heard, [stub(title: title).as_null_object] )

    render
    rendered.should have_content( I18n.t('most_heard') )
    rendered.should have_content( title )
  end

end
