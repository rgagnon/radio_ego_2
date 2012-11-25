#encoding=utf-8
require 'spec_helper'

describe HomeController do

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end

    it "fourni les plus écoutés" do
      most_heard = [stub, stub]
      Audio.stub(most_heard: most_heard)
      get 'index'
      assigns(:most_heard).should == most_heard
    end
  end
end
