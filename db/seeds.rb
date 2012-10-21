# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

(1..5).each do |num|
  fake_course = "CS#{num}"
  Course.create(:course_num => fake_course, :title => fake_course, :university => fake_course)
end

videos = [{ :name => 'Cast 1',
            :time => '30:40',
	    :size => '5MB',
	    :course_id => 'c1'},

	  { :name => 'Algorithms',
            :time => '19:15',
	    :size => '3.7MB',
	    :course_id => 'c2'}, ]

videos.each do |v|
  Video.create!(v)
end
      
