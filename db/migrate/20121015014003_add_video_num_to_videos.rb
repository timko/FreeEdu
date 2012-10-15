class AddVideoNumToVideos < ActiveRecord::Migration
  def change
    add_column :videos, :video_num, :string
  end
end
