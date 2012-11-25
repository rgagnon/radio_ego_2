#encoding=utf-8
require 'spec_helper'

describe Audio do
  it "fourni les plus écoutés en ordre descendant" do
    audio1 = Audio.create!({title: 'something 1', listen_count: 1})
    audio2 = Audio.create!({title: 'something 2', listen_count: 2})
    audio3 = Audio.create!({title: 'something 3', listen_count: 3})
    audio3b = Audio.create!({title: 'something 3b', listen_count: 3})
    audio4 = Audio.create!({title: 'something 4', listen_count: 4})

    Audio.most_heard.should == [audio4, audio3, audio3b, audio2, audio1]
  end
end
