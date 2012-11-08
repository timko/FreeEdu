# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
begin
(1..5).each do |num|
    fake_course = "CS#{num}"
    course = Course.new(:course_num => fake_course, :title => fake_course, :university => fake_course)
    video = course.videos.build({ :name => 'Cast 1',
      :time => '30:40',
      :course_num => fake_course,
      :size => '5MB'})
    course.save!
  end
rescue
end
User.create!(:name => 'admin', :password => 'admin', :settings => {:disk_space=> 512, :bandwidth=>160})
