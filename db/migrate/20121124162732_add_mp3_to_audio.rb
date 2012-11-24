class AddMp3ToAudio < ActiveRecord::Migration
  def change
    add_attachment :audios, :mp3
  end
end
