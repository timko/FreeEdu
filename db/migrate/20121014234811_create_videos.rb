class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :time
      t.string :size
      t.string :course_num
      t.integer :video_num
      t.references :course
      t.timestamps
    end
  end
end
