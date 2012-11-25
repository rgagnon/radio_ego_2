class HomeController < ApplicationController
  def index
    @most_heard = Audio.most_heard
  end
end
