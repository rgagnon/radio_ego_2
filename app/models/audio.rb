class Audio < ActiveRecord::Base
  belongs_to :user
  attr_accessible :title, :mp3, :user_id

  has_attached_file :mp3, path: ":rails_root/public/files/:user_id/:id", url: "/files/:user_id/:id"
end
