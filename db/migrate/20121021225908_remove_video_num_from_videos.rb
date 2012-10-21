class RemoveVideoNumFromVideos < ActiveRecord::Migration
  def up
    remove_column :videos, :video_num
  end

  def down
    add_column :videos, :video_num, :string
  end
end
