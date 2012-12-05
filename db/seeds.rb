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
  :size => '100MB',
  :source => "https://www.youtube.com/embed/8qeB4bNr5QM?feature=player_embedded")
course.videos.build(:name => 'Cast 2',
  :time => '49:04',
  :size => '100MB',
  :source => "https://www.youtube.com/embed/HuClDnHastQ?feature=player_embedded")
course.videos.build(:name => 'Cast 3',
  :time => '47:05',
  :size => '100MB',
  :source => "https://www.youtube.com/embed/MlE5PhV_mjY?feature=player_embedded")
course.videos.build(:name => 'Cast 4',
  :time => '47:41',
  :size => '100MB',
  :source => "https://www.youtube.com/embed/j7sAqlGS5y8?feature=player_embedded")
course.videos.build(:name => 'Cast 5',
  :time => '50:44',
  :size => '100MB',
  :source => "https://www.youtube.com/embed/C76tUUh13Hs?feature=player_embedded")
course.videos.build(:name => 'Cast 6',
  :time => '43:48',
  :size => '100MB',
  :source => "https://www.youtube.com/embed/KJitQn-E-lc?feature=player_embedded")
course.videos.build(:name => 'Cast 7',
  :time => '49:23',
  :size => '100MB',
  :source => "https://www.youtube.com/embed/P-MM1u3unW8?feature=player_embedded")
course.videos.build(:name => 'Cast 8',
  :time => '47:19',
  :size => '100MB',
  :source => "https://www.youtube.com/embed/NRvj-tAUJRA?feature=player_embedded")
course.videos.build(:name => 'Cast 9',
  :time => '44:36',
  :size => '100MB',
  :source => "https://www.youtube.com/embed/tB60tPouQ-I?feature=player_embedded")
course.videos.build(:name => 'Cast 10',
  :time => '33:46',
  :size => '100MB',
  :source => "https://www.youtube.com/embed/iApWoxUVUHM?feature=player_embedded")
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
course.videos.build(:name => 'Cast 3',
  :time => '1:19:53',
  :size => '100MB',
  :source => "https://www.youtube.com/embed/0zAGg6eVgw8?feature=player_embedded")
course.videos.build(:name => 'Cast 4',
  :time => '1:18:08',
  :size => '100MB',
  :source => "https://www.youtube.com/embed/vgBfP6osk-Y?feature=player_embedded")
course.videos.build(:name => 'Cast 5',
  :time => '1:21:29',
  :size => '100MB',
  :source => "https://www.youtube.com/embed/-VZiGIFpoVM?feature=player_embedded")
course.videos.build(:name => 'Cast 6',
  :time => '1:19:06',
  :size => '100MB',
  :source => "https://www.youtube.com/embed/XZT4V3sKkoo?feature=player_embedded")
course.videos.build(:name => 'Cast 7',
  :time => '1:17:32',
  :size => '100MB',
  :source => "https://www.youtube.com/embed/E6rXYu6P_F0?feature=player_embedded")
course.videos.build(:name => 'Cast 8',
  :time => '1:19:53',
  :size => '100MB',
  :source => "https://www.youtube.com/embed/T4OxVwMFfKo?feature=player_embedded")
course.videos.build(:name => 'Cast 9',
  :time => '1:31:01',
  :size => '100MB',
  :source => "https://www.youtube.com/embed/zfvnF1AyIhc?feature=player_embedded")
course.videos.build(:name => 'Cast 10',
  :time => '1:08:57',
  :size => '100MB',
  :source => "https://www.youtube.com/embed/2k3-icd6SnM?feature=player_embedded")
course.save!

course = Course.new(:subject => 'Biology', :title =>  'General Biology', :description => 'This is an introductory course to Biology.')
course.videos.build(:name => 'Cast 1',
  :time => '48:40',
  :size => '100MB',
  :source => "https://www.youtube.com/embed/ncBvY10anDI?feature=player_embedded")
course.videos.build(:name => 'Cast 2',
  :time => '49:45',
  :size => '100MB',
  :source => "https://www.youtube.com/embed/alTT1AQcIWY?feature=player_embedded")
course.videos.build(:name => 'Cast 3',
  :time => '50:15',
  :size => '100MB',
  :source => "https://www.youtube.com/embed/7ZSDANEwzc4?feature=player_embedded")
course.videos.build(:name => 'Cast 4',
  :time => '49:13',
  :size => '100MB',
  :source => "https://www.youtube.com/embed/S0HZN9jV6tE?feature=player_embedded")
course.videos.build(:name => 'Cast 5',
  :time => '50:26',
  :size => '100MB',
  :source => "https://www.youtube.com/embed/KRwhfEvxEfYI?feature=player_embedded")
course.videos.build(:name => 'Cast 6',
  :time => '43:25',
  :size => '100MB',
  :source => "https://www.youtube.com/embed/nRsSj4SDqsY?feature=player_embedded")
course.videos.build(:name => 'Cast 7',
  :time => '47:50',
  :size => '100MB',
  :source => "https://www.youtube.com/embed/nRsSj4SDqsY?feature=player_embedded")
course.videos.build(:name => 'Cast 8',
  :time => '43:30',
  :size => '100MB',
  :source => "https://www.youtube.com/embed/-3sM75902Z8?feature=player_embedded")
course.videos.build(:name => 'Cast 9',
  :time => '49:52',
  :size => '100MB',
  :source => "https://www.youtube.com/embed/tUnUvjcVnK8?feature=player_embedded")
course.videos.build(:name => 'Cast 10',
  :time => '49:11',
  :size => '100MB',
  :source => "https://www.youtube.com/embed/ikRD9xhCF8I?feature=player_embedded")
course.save!

course = Course.new(:subject => 'Chemistry', :title =>  'General Chemistry', :description => 'This is an introductory course to Chemistry.')
course.videos.build(:name => 'Cast 1',
  :time => '50:36',
  :size => '100MB',
  :source => "https://www.youtube.com/embed/uei-dyTh2EA?feature=player_embedded")
course.videos.build(:name => 'Cast 2',
  :time => '51:44',
  :size => '100MB',
  :source => "https://www.youtube.com/embed/2kcnDNdwWx8?feature=player_embedded")
course.videos.build(:name => 'Cast 3',
  :time => '49:50',
  :size => '100MB',
  :source => "https://www.youtube.com/embed/rSBQ6nvKMlQ?feature=player_embedded")
course.videos.build(:name => 'Cast 4',
  :time => '50:28',
  :size => '100MB',
  :source => "https://www.youtube.com/embed/jci--jzV0pE?feature=player_embedded")  
course.videos.build(:name => 'Cast 5',
  :time => '54:01',
  :size => '100MB',
  :source => "https://www.youtube.com/embed/Z-KxkmsHhD0?feature=player_embedded")
course.videos.build(:name => 'Cast 6',
  :time => '50:06',
  :size => '100MB',
  :source => "https://www.youtube.com/embed/kB4EjCBbp08?feature=player_embedded")
course.videos.build(:name => 'Cast 7',
  :time => '49:37',
  :size => '100MB',
  :source => "https://www.youtube.com/embed/tXwc3veBZqk?feature=player_embedded")
course.videos.build(:name => 'Cast 8',
  :time => '49:42',
  :size => '100MB',
  :source => "https://www.youtube.com/embed/WIE3L1d8SeE?feature=player_embedded")
course.videos.build(:name => 'Cast 9',
  :time => '49:22',
  :size => '100MB',
  :source => "https://www.youtube.com/embed/qQ1CuzFDg_o?feature=player_embedded")
course.videos.build(:name => 'Cast 10',
  :time => '46:54',
  :size => '100MB',
  :source => "https://www.youtube.com/embed/JmG1GQ0icw0?feature=player_embedded")
course.save!

course = Course.new(:subject => 'Earth and Planetary Science', :title => 'Earthquakes in Your Backyard', :description => 'This is an introduction to earthquakes, their causes and effects.')
course.videos.build(:name => 'Cast 1',
  :time => '55:26',
  :size => '100MB',
  :source => "https://www.youtube.com/embed/NDdKJYwQ8q0?feature=player_embedded")
course.videos.build(:name => 'Cast 2',
  :time => '58:57',
  :size => '100MB',
  :source => "https://www.youtube.com/embed/UjkFjX2KJJY?feature=player_embedded")
course.videos.build(:name => 'Cast 3',
  :time => '1:01:56',
  :size => '100MB',
  :source => "https://www.youtube.com/embed/4lbsiJ-6KXI?feature=player_embedded")
course.videos.build(:name => 'Cast 4',
  :time => '54:11',
  :size => '100MB',
  :source => "https://www.youtube.com/embed/hzNPvHc14-Q?feature=player_embedded")
course.videos.build(:name => 'Cast 5',
  :time => '52:57',
  :size => '100MB',
  :source => "https://www.youtube.com/embed/bN1njWeCRAk?feature=player_embedded")
course.videos.build(:name => 'Cast 6',
  :time => '52:43',
  :size => '100MB',
  :source => "https://www.youtube.com/embed/Vc_wP6uD2CU?feature=player_embedded")
course.videos.build(:name => 'Cast 7',
  :time => '55:02',
  :size => '100MB',
  :source => "https://www.youtube.com/embed/x2BzJ9LkCfY?feature=player_embedded")
course.videos.build(:name => 'Cast 8',
  :time => '59:08',
  :size => '100MB',
  :source => "https://www.youtube.com/embed/qi6eEnksW6k?feature=player_embedded")
course.videos.build(:name => 'Cast 9',
  :time => '53:02',
  :size => '100MB',
  :source => "https://www.youtube.com/embed/Pow0DBMMXZg?feature=player_embedded")
course.videos.build(:name => 'Cast 10',
  :time => '1:04:49',
  :size => '100MB',
  :source => "https://www.youtube.com/embed/p9oPkRO-DoI?feature=player_embedded")
course.save!

course = Course.new(:subject => 'Electrical Engineering', :title =>  'Electronic Techniques for Engineering', :description => 'This is an introductory about electrical engineering and circuits.')
course.videos.build(:name => 'Cast 2',
  :time => '50:25',
  :size => '100MB',
  :source => "https://www.youtube.com/embed/sVKTUtlj33A?feature=player_embedded")
course.videos.build(:name => 'Cast 3',
  :time => '49:00',
  :size => '100MB',
  :source => "https://www.youtube.com/embed/eezVEWYhw_k?feature=player_embedded") 
course.videos.build(:name => 'Cast 4',
  :time => '50:21',
  :size => '100MB',
  :source => "https://www.youtube.com/embed/TTF6AjWngkU?feature=player_embedded")
course.videos.build(:name => 'Cast 5',
  :time => '47:38',
  :size => '100MB',
  :source => "https://www.youtube.com/embed/eCBxmHLTEW4?feature=player_embedded")
course.videos.build(:name => 'Cast 6',
  :time => '44:34',
  :size => '100MB',
  :source => "https://www.youtube.com/embed/uFDteg6tXTA?feature=player_embedded")
course.videos.build(:name => 'Cast 7',
  :time => '50:59',
  :size => '100MB',
  :source => "https://www.youtube.com/embed/7JGtRQj_L-Q?feature=player_embedded")
course.videos.build(:name => 'Cast 8',
  :time => '48:56',
  :size => '100MB',
  :source => "https://www.youtube.com/embed/3ohH02XzR14?feature=player_embedded")
course.videos.build(:name => 'Cast 9',
  :time => '52:17',
  :size => '100MB',
  :source => "https://www.youtube.com/embed/tC-jxkn08yw?feature=player_embedded")
course.videos.build(:name => 'Cast 10',
  :time => '46:14',
  :size => '100MB',
  :source => "https://www.youtube.com/embed/ZflmAAe8qUk?feature=player_embedded")
course.videos.build(:name => 'Cast 11',
  :time => '45:40',
  :size => '100MB',
  :source => "https://www.youtube.com/embed/fmLAzAm1yEE?feature=player_embedded")
course.save!

course = Course.new(:subject => 'Economics', :title =>  'Introduction to Environmental Economics and Policy', :description => 'This is an introduction to microeconomics.')
course.videos.build(:name => 'Cast 1',
  :time => '1:18:26',
  :size => '100MB',
  :source => "https://www.youtube.com/embed/fmLAzAm1yEE?feature=player_embedded")
course.videos.build(:name => 'Cast 2',
  :time => '1:12:24',
  :size => '100MB',
  :source => "https://www.youtube.com/embed/AAzvLSXsf-4?feature=player_embedded")
course.videos.build(:name => 'Cast 3',
  :time => '1:16:39',
  :size => '100MB',
  :source => "https://www.youtube.com/embed/6W6nY_ZoBmA?feature=player_embedded")
course.videos.build(:name => 'Cast 4',
  :time => '1:16:55',
  :size => '100MB',
  :source => "https://www.youtube.com/embed/be4gcx0EtzA?feature=player_embedded")
course.videos.build(:name => 'Cast 5',
  :time => '1:13:37',
  :size => '100MB',
  :source => "https://www.youtube.com/embed/1cXPFOBlgEk?feature=player_embedded")
course.videos.build(:name => 'Cast 6',
  :time => '1:17:38',
  :size => '100MB',
  :source => "https://www.youtube.com/embed/uInSp-7JL88?feature=player_embedded")
course.videos.build(:name => 'Cast 7',
  :time => '1:15:44',
  :size => '100MB',
  :source => "https://www.youtube.com/embed/OaKyQHvfcrU?feature=player_embedded")
course.videos.build(:name => 'Cast 8',
  :time => '1:19:45',
  :size => '100MB',
  :source => "https://www.youtube.com/embed/aHhT43SFR7k?feature=player_embedded")
course.videos.build(:name => 'Cast 9',
  :time => '1:18:07',
  :size => '100MB',
  :source => "https://www.youtube.com/embed/OScxAa9hCdg?feature=player_embedded")
course.videos.build(:name => 'Cast 10',
  :time => '1:05:58',
  :size => '100MB',
  :source => "https://www.youtube.com/embed/fLNR8J_5w30?feature=player_embedded")
course.save!

course = Course.new(:subject => 'Electrical Engineering', :title =>  'Microelectronic Devics and Circuits', :description => 'This is a course about analog integrated circuits.')
course.videos.build(:name => 'Cast 1',
  :time => '1:15:08',
  :size => '100MB',
  :source => "https://www.youtube.com/embed/HukR2JlICU0?feature=player_embedded")
course.videos.build(:name => 'Cast 2',
  :time => '1:19:09',
  :size => '100MB',
  :source => "https://www.youtube.com/embed/8sBofGHcmZY?feature=player_embedded")
course.videos.build(:name => 'Cast 3',
  :time => '1:22:16',
  :size => '100MB',
  :source => "https://www.youtube.com/embed/BuWKTfSQQDQ?feature=player_embedded")
course.videos.build(:name => 'Cast 4',
  :time => '1:15:09',
  :size => '100MB',
  :source => "https://www.youtube.com/embed/25kERWNuFPM?feature=player_embedded")  
course.videos.build(:name => 'Cast 5',
  :time => '1:17:37',
  :size => '100MB',
  :source => "https://www.youtube.com/embed/pqEnFAnWiX0?feature=player_embedded")
course.videos.build(:name => 'Cast 6',
  :time => '1:25:33',
  :size => '100MB',
  :source => "https://www.youtube.com/embed/KJVpwzOvxyg?feature=player_embedded")
course.videos.build(:name => 'Cast 7',
  :time => '1:19:37',
  :size => '100MB',
  :source => "https://www.youtube.com/embed/UN_77ZO2zqY?feature=player_embedded")
course.videos.build(:name => 'Cast 8',
  :time => '1:16:51',
  :size => '100MB',
  :source => "https://www.youtube.com/embed/Xgv7lbR8leA?feature=player_embedded")
course.videos.build(:name => 'Cast 9',
  :time => '1:17:36',
  :size => '100MB',
  :source => "https://www.youtube.com/embed/pHBrlKEzEOI?feature=player_embedded")
course.videos.build(:name => 'Cast 10',
  :time => '1:19:57',
  :size => '100MB',
  :source => "https://www.youtube.com/embed/-mIsbhYgPCI?feature=player_embedded")
course.save!

course = Course.new(:subject => 'Chemistry', :title =>  'Chemical Structure and Reactivity', :description => 'This is an introductory about natural product chemistry.')
course.videos.build(:name => 'Cast 1',
  :time => '1:15:41',
  :size => '100MB',
  :source => "https://www.youtube.com/embed/SgJKRvchP9s?feature=player_embedded")
course.videos.build(:name => 'Cast 2',
  :time => '1:20:41',
  :size => '100MB',
  :source => "https://www.youtube.com/embed/kW3BbtQVbOY?feature=player_embedded") 
course.videos.build(:name => 'Cast 3',
  :time => '1:16:29',
  :size => '100MB',
  :source => "https://www.youtube.com/embed/oDL5qLPVFfA?feature=player_embedded")
course.videos.build(:name => 'Cast 4',
  :time => '1:20:45',
  :size => '100MB',
  :source => "https://www.youtube.com/embed/u9D-dHDUqAU?feature=player_embedded")
course.videos.build(:name => 'Cast 5',
  :time => '1:17:07',
  :size => '100MB',
  :source => "https://www.youtube.com/embed/pfsE1-0jhfo?feature=player_embedded")
course.videos.build(:name => 'Cast 6',
  :time => '1:08:02',
  :size => '100MB',
  :source => "https://www.youtube.com/embed/JuJHkVGWbg4?feature=player_embedded")
course.videos.build(:name => 'Cast 7',
  :time => '1:14:07',
  :size => '100MB',
  :source => "https://www.youtube.com/embed/mVGZmUGDeco?feature=player_embedded")
course.videos.build(:name => 'Cast 8',
  :time => '1:16:58',
  :size => '100MB',
  :source => "https://www.youtube.com/embed/WfioElO6dUU?feature=player_embedded")
course.videos.build(:name => 'Cast 9',
  :time => '1:14:06',
  :size => '100MB',
  :source => "https://www.youtube.com/embed/Eg9bpa9VRX0?feature=player_embedded")
course.videos.build(:name => 'Cast 10',
  :time => '1:14:00',
  :size => '100MB',
  :source => "https://www.youtube.com/embed/HeMQt2GYnjQ?feature=player_embedded")
course.save!

course = Course.new(:subject => 'Computer Science', :title =>  'Operating Systems and System Programming', :description => 'This is a course on operating systems and system programming.')
course.videos.build(:name => 'Cast 1',
  :time => '1:19:37',
  :size => '100MB',
  :source => "https://www.youtube.com/embed/FZeAsGMjz8k?feature=player_embedded")
course.videos.build(:name => 'Cast 2',
  :time => '1:24:40',
  :size => '100MB',
  :source => "https://www.youtube.com/embed/9Wfth-B1kR4?feature=player_embedded")
course.videos.build(:name => 'Cast 3',
  :time => '1:19:51',
  :size => '100MB',
  :source => "https://www.youtube.com/embed/bcBapy5XQMA?feature=player_embedded")
course.videos.build(:name => 'Cast 4',
  :time => '1:18:08',
  :size => '100MB',
  :source => "https://www.youtube.com/embed/tGsuMvslnOc?feature=player_embedded")
course.videos.build(:name => 'Cast 5',
  :time => '54:41',
  :size => '100MB',
  :source => "https://www.youtube.com/embed/2sUt0wj1ntQ?feature=player_embedded")
course.videos.build(:name => 'Cast 6',
  :time => '1:07:06',
  :size => '100MB',
  :source => "https://www.youtube.com/embed/s0KRR9PLGNw?feature=player_embedded")
course.videos.build(:name => 'Cast 7',
  :time => '1:18:12',
  :size => '100MB',
  :source => "https://www.youtube.com/embed/l6a24EY7M7w?feature=player_embedded")
course.videos.build(:name => 'Cast 8',
  :time => '1:21:35',
  :size => '100MB',
  :source => "https://www.youtube.com/embed/vRVX-2Mtc9Q?feature=player_embedded")
course.videos.build(:name => 'Cast 9',
  :time => '1:20:41',
  :size => '100MB',
  :source => "https://www.youtube.com/embed/9ES6Xy89Va0?feature=player_embedded")
course.videos.build(:name => 'Cast 10',
  :time => '1:21:16',
  :size => '100MB',
  :source => "https://www.youtube.com/embed/jNTzj61Osw4?feature=player_embedded")
course.save!

course = Course.new(:subject => 'Computer Science', :title =>  'The Structure and Interpretation of Computer Programs', :description => 'This is an introductory course about programming and computer science.')
course.videos.build(:name => 'Cast 1',
  :time => '47:02',
  :size => '100MB',
  :source => "https://www.youtube.com/embed/jNTzj61Osw4?feature=player_embedded")
course.videos.build(:name => 'Cast 2',
  :time => '48:15',
  :size => '100MB',
  :source => "https://www.youtube.com/embed/9Sc8_LjdccY?feature=player_embedded")
course.videos.build(:name => 'Cast 3',
  :time => '50:52',
  :size => '100MB',
  :source => "https://www.youtube.com/embed/oLgtWW6sOWU?feature=player_embedded")
course.videos.build(:name => 'Cast 4',
  :time => '49:47',
  :size => '100MB',
  :source => "https://www.youtube.com/embed/e-zl5B_J2cs?feature=player_embedded")  
course.videos.build(:name => 'Cast 5',
  :time => '50:03',
  :size => '100MB',
  :source => "https://www.youtube.com/embed/LTnqrHEPFME?feature=player_embedded")
course.videos.build(:name => 'Cast 6',
  :time => '50:03',
  :size => '100MB',
  :source => "https://www.youtube.com/embed/flTjHziSApk?feature=player_embedded")
course.videos.build(:name => 'Cast 7',
  :time => '48:46',
  :size => '100MB',
  :source => "https://www.youtube.com/embed/Y908dmlp1Sk?feature=player_embedded")
course.videos.build(:name => 'Cast 8',
  :time => '49:33',
  :size => '100MB',
  :source => "https://www.youtube.com/embed/yFTZUcgb58o?feature=player_embedded")
course.videos.build(:name => 'Cast 9',
  :time => '48:57',
  :size => '100MB',
  :source => "https://www.youtube.com/embed/m1R-6_CGRAg?feature=player_embedded")
course.videos.build(:name => 'Cast 10',
  :time => '50:46',
  :size => '100MB',
  :source => "https://www.youtube.com/embed/vCgtg4gEEok?feature=player_embedded")
course.save!
