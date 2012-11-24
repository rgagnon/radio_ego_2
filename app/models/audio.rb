class Audio < ActiveRecord::Base
  belongs_to :user
  attr_accessible :title, :mp3

  has_attached_file :mp3, path: ":rails_root/files/:user_id/:id"
end
