Given /the following courses exist/ do |courses_table|
  courses_table.hashes.each do |course|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
    Course.create!(course)
  end
end

Given /the following videos exist/ do |videos_table|
  videos_table.hashes.each do |video|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
    course = Course.find(video[:course_id])
    video[:course_num] = course.course_num
    course.videos.create!(video)
  end
end

#Then /^I should see the image "(.+)"$/ do |image|
#    page.should have_xpath("//img[@src=\"/assets/images/#{image}\"]")
#end

