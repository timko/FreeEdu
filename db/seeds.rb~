# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
course = Course.new(:subject => 'Computer Science', :title => 'The Beauty and Joy of Computing', :description => 'This is an introductory course to Computer Science.')
course.videos.build(:name => 'Cast 1',
  :time => '47:53',
  :size => '54.6MB',
  :source => "https://www.youtube.com/embed/8qeB4bNr5QM?feature=player_embedded")
course.videos.build(:name => 'Cast 2',
  :time => '49:04',
  :size => '59.7MB',
  :source => "https://www.youtube.com/embed/HuClDnHastQ?feature=player_embedded")
course.save!

course = Course.new(:subject => 'Computer Science', :title =>  'Software Engineering', :description => 'This is a course about programming real world software applications.')
course.videos.build(:name => 'Cast 1',
  :time => '1:14:49',
  :size => '186MB',
  :source => "https://www.youtube.com/embed/Fr-B4xHZRzY?feature=player_embedded")
course.videos.build(:name => 'Cast 2',
  :time => '1:17:08',
  :size => '167MB',
  :source => "https://www.youtube.com/embed/SeBAj4P2FWA?feature=player_embedded")  
course.save!

course = Course.new(:subject => 'Biology', :title =>  'General Biology', :description => 'This is an introductory course to Biology.')
course.videos.build(:name => 'Cast 1',
  :time => '48:40',
  :size => '116MB',
  :source => "https://www.youtube.com/embed/ncBvY10anDI?feature=player_embedded")
course.videos.build(:name => 'Cast 2',
  :time => '49:45',
  :size => '129MB',
  :source => "https://www.youtube.com/embed/alTT1AQcIWY?feature=player_embedded")  
course.save!
User.create!(:name => 'kelvin', :password_digest => 'abcde', :settings => {:disk_space=> 512, :bandwidth=>160})
