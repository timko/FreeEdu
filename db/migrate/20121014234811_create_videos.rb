class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :time
      t.string :size
      t.string :course_id

      t.timestamps
    end
  end
end
