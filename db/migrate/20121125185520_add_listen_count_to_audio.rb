class AddListenCountToAudio < ActiveRecord::Migration
  def change
    add_column :audios, :listen_count, :integer
  end
end
