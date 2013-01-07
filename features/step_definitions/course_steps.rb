Given /the following courses exist/ do |courses_table|
  courses_table.hashes.each do |course|
    Course.create!(course)
  end
end

Given /the following videos exist/ do |videos_table|
  videos_table.hashes.each do |video|
    Course.find(video[:course_id]).videos.create!(video)
  end
end

Given /the following users exist/ do |users_table|
  users_table.hashes.each do |user|
    User.create!(user)
  end
end