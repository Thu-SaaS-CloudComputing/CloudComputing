# encoding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
categories = [{:name => '新闻', :description => '', :option => {}, :show_on_index => "shown"},
              {:name => '公告', :description => '', :option => {}, :show_on_index => "shown"},
              {:name => 'Chicken Soup', :description => '', :option => {}, :parent => 1, :show_on_index => "unavailable"},
              {:name => 'secret', :description => '', :option => {}, :show_on_index => "hidden"}
]

categories.each do |category|
  Category.create!(category)
end

Category.create!({:name => 'regular', :description => '', :option => {}, :parent => Category.find_by_name('公告').id, :show_on_index => 'unavailable'})
Category.create!({:name => 'urgent', :description => '', :option => {}, :parent => Category.find_by_name('公告').id, :show_on_index => 'unavailable'})

articles = [{:title => 'Test title', :author => 'admin', :category => Category.find_by_name('新闻'), :content => "test1"},
           {:title => '哈哈哈', :author => 'cgcgbcbc', :category => Category.find_by_name('公告'),  :content => "test1"},
           {:title => 'News No.1', :author => 'admin zjx', :category => Category.find_by_name('新闻'), :content => "test1"},
           {:title => 'News No.2', :author => 'admin zjx', :category => Category.find_by_name('新闻'),  :content => "test1"},
           {:title => 'News No.3', :author => 'admin zjx', :category => Category.find_by_name('新闻'),  :content => "test1"},
           {:title => 'News No.4', :author => 'admin zjx', :category => Category.find_by_name('新闻'),  :content => "test1"},
           {:title => 'Announcement No.1', :author => 'admin zjx', :category => Category.find_by_name('公告'),  :content => "test1"},
           {:title => 'Announcement No.2(urgent)', :author => 'admin zjx', :category => Category.find_by_name('urgent'),  :content => "test1"},
           {:title => 'Announcement No.3(regular)', :author => 'admin zjx', :category => Category.find_by_name('regular'),  :content => "test1"},
           {:title => 'Be Still With God', :author => 'Nancy B. Gibbs', :category => Category.find_by_name('Chicken Soup'),
                :content => "All day long I had been very busy; picking up trash, cleaning bathrooms and scrubbing floors. My grown children were coming home for the weekend. I went grocery shopping and prepared for a barbecue supper, complete with ribs and chicken. I wanted everything to be perfect.  Suddenly, it dawned on me that I was dog-tired. I simply couldn't work as long as I could when I was younger. \"I\'ve got to rest for a minute,\" I told my husband, Roy, as I collapsed into my favorite rocking chair. Music was playing, my dog and cat were chasing each other and the telephone rang.  A scripture from Psalm 46 popped into my mind. \"Be still, and know that I am God.\" I realized that I hadn't spent much time in prayer that day. Was I too busy to even utter a simple word of thanks to God? Suddenly, the thought of my beautiful patio came to mind. I can be quiet out there, I thought. I longed for a few minutes alone with God.  Roy and I had invested a great deal of time and work in the patio that spring. The flowers and hanging baskets were breathtaking. It was definitely a heavenly place of rest and tranquility. If I can't be still with God in that environment, I can't be still with Him anywhere, I thought. While Roy was talking on the telephone, I slipped out the backdoor and sat down on my favorite patio chair. I closed my eyes and began to pray, counting my many blessings.  A bird flew by me, chirping and singing. It interrupted my thoughts. It landed on the bird feeder and began eating dinner as I watched. After a few minutes it flew away, singing another song. I closed my eyes again. A gust of wind blew, which caused my wind chimes to dance. They made a joyful sound, but again I lost my concentration on God. I squirmed and wiggled in my chair. I looked up toward the blue sky and saw the clouds moving slowly toward the horizon. The wind died down. My wind chimes finally became quiet.   Again, I bowed in prayer. \"Honk, honk,\" I heard. I almost jumped out of my skin.A neighbor was driving down the street. He waved at me and smiled. I waved back, happy that he cared. I quickly tried once again to settle down, repeating the familiar verse in my mind. Be still and know that I am God.  \"I\'m trying God. I really am,\" I whispered. \"But you\'ve got to help me here.\"The backdoor opened. My husband walked outside. \"I love you,\" he said. \"I was wondering where you were.\" I chuckled, as he came over and kissed me, then turned around and went back inside.  \"Where's the quiet time?\" I asked God. My heart fluttered. There was no pain, only a beat that interrupted me yet again. This is impossible, I thought. There's no time to be still and to know that God is with me. There's too much going on in the world and entirely too much activity all around me.  Then it suddenly dawned on me. God was speaking to me the entire time I was attempting to be still. I remembered the music playing as I'd begun my quiet time. He sent a sparrow to lighten my life with song. He sent a gentle breeze. He sent a neighbor to let me know that I had a friend. He sent my sweetheart to offer sincere sentiments of love. He caused my heart to flutter to remind me of life. While I was trying to count my blessings, God was busy multiplying them.   I laughed to realize that the \"interruptions\" of my quiet time with God were special blessings He'd sent to show me He was with me the entire time. "},
           {:title => 'Plant a Row for the Hungry', :author => 'Jeff Lowenfels', :category => Category.find_by_name('Chicken Soup'),
                :content => "It was a cold night in Washington, D.C., and I was heading back to the hotel when a man approached me. He asked if I would give him some money so he could get something to eat. I'd read the signs: \"Don't give money to panhandlers.\" So I shook my head and kept walking.  I wasn't prepared for a reply, but with resignation, he said, \"I really am homeless and I really am hungry! You can come with me and watch me eat!\" But I kept on walking.   The incident bothered me for the rest of the week. I had money in my pocket and it wouldn't have killed me to hand over a buck or two even if he had been lying. On a frigid, cold night, no less, I assumed the worst of a fellow human being.   Flying back to Anchorage, I couldn't help thinking of him. I tried to rationalize my failure to help by assuming government agencies, churches and charities were there to feed him. Besides, you're not supposed to give money to panhandlers.  Somewhere over Seattle, I started to write my weekly garden column for The Anchorage Daily News. Out of the blue, I came up with an idea. Bean's Cafe, the soup kitchen in Anchorage, feeds hundreds of hungry Alaskans every day. Why not try to get all my readers to plant one row in their gardens dedicated to Bean's? Dedicate a row and take it down to Bean's. Clean and simple.  We didn't keep records back then, but the idea began to take off. Folks would fax me or call when they took something in. Those who only grew flowers donated them. Food for the spirit. And salve for my conscience.  In 1995, the Garden Writers Association of America held their annual convention in Anchorage and after learning of Anchorage's 2  program, Plant a Row for Bean's became Plant a Row For The Hungry. The original idea was to have every member of the Garden Writers Association of America write or talk about planting a row for the hungry sometime during the month of April.   As more and more people started working with the Plant a Row concept, new variations cropped up, if you will pardon the pun. Many companies gave free seed to customers and displayed the logo, which also appeared in national gardening publications.  Row markers with the Plant a Row logo were distributed to gardeners to set apart their \"Row for the Hungry.\"  Garden editor Joan Jackson, backed by The San Jose Mercury News and California's nearly year-round growing season, raised more than 30,000 pounds of fruits and vegetables her first year, and showed GWAA how the program could really work. Texas fruit farms donated food to their local food bank after being inspired by Plant a Row. Today the program continues to thrive and grow.  I am stunned that millions of Americans are threatened by hunger. If every gardener in America - and we're seventy million strong - plants one row for the hungry, we can make quite a dent in the number of neighbors who don't have enough to eat. Maybe then I will stop feeling guilty about abandoning a hungry man I could have helped."},
           {:title => 'Beyond Expectations', :author => 'Milt Garret', :category => Category.find_by_name('Chicken Soup'),
                :content => "It seems a car dealership in my hometown of Albuquerque was selling, on average, six to eight new cars a day, six days a week.  I was also told that 72 percent of this dealership's first-time visitors returned for a second visit.  (At that time, the average for all dealerships in Albuquerque for second-time visitors was 8 percent.)         I was curious and intrigued.  How does a car dealership get 72 percent of its first-time visitors to return? And how can they sell six to eight cars a day in a slumping car market?         When I walked into Saturn of Albuquerque that Friday four years ago, the staff there didn't know me from Adam; yet they shared with me their pricing policy, the profit margin on every model, and staff income.  They even opened their training manuals for my review and invited me back on Saturday if I wanted more information (an invitation I heartily accepted).        I learned that this dealership (like all Saturn dealerships) has a \"no-dicker sticker\" policy; that is, the price on the window is the price you pay for the car.  Period.  You can't even negotiate for a free set of floor mats.  Saturn abides by its premise of selling high-quality automobiles for a reasonable price.        Furthermore, Saturn sales consultants (their term for customer-contact people) aren't paid a commission - they're salaried.  This means when you walk onto the showroom floor you're not bombarded with what I refer to as \"beyond eager\" sales people.         I expanded my research to other dealerships in Albuquerque.  It turned out that Ford Escorts, LTDs and Thunderbirds, as well as the Mercury Marquis, were also sold as \"no-dicker sticker\" cars.  As Bruce Sutherland at Richardson Ford said, \"We were losing our market to Saturn because of their pricing and salary policies.\"  He also said, \"If we all did what Saturn was doing, we'd not only make a decent living, but we'd also enjoy a better reputation.\"         On Sunday, the day after my second visit to the Saturn store (their term, not mine), my wife, Jane, and I were walking as we frequently do.  On this particular June morning, Jane gently slipped her hand in mine and said tenderly, \"I don't know if you remember, but today's my fifth anniversary of being cancer-free.\"  She was diagnosed with breast cancer five years ago and had undergone surgery.  I was stunned, partially because I was embarrassed that I had forgotten, and, partially, because...well, it seems we spend all of our time earning a living and never stop to live our earnings.  I mean, isn't this what it's really all about?"}
]

articles.each do |article|
  Article.create!(article)
end


lessons = [
           {:name => "Algorithm Design", :column => 1, :row => 3, :classroom => "学堂117", :department => "姚班"},
           {:name => "程序设计", :column => 2, :row => 2, :classroom => "学堂112", :department => "姚班"},
           {:name => "What's the hell", :column => 1, :row => 3, :classroom => "Hell", :department => "Physics"},
           {:name => "Quantum Theory", :column => 3, :row => 5, :classroom => "Schrdinger", :department => "Physics"},
           {:name => "Computing Biology", :column => 4, :row => 2, :classroom => "Turing", :department => "Biology"}
          ]

lessons.each do |lesson|
  Lesson.create!(lesson)
end

plugins = [
  {:name => "carousel", :description => "首页上的滚动图片新闻", :enable => false}
]
plugins.each do |plugin|
  Plugins.create!(plugin)
end

root_users = [
              {:username => "admin", :password => "admin"}
             ]

root_users.each do |root_user|
  Root.create!(root_user)
end


priviledges = Array.new
Category.all.each do |cat|
  priviledges << {:name => "edit_category_" + cat.id.to_s, :description => "Empty"}
  priviledges << {:name => "delete_category_" + cat.id.to_s, :description => "Empty"}
  priviledges << {:name => "add_articles_under_" + cat.id.to_s, :description => "Empty"}
  priviledges << {:name => "edit_articles_under_" + cat.id.to_s, :description => "Empty"}
  priviledges << {:name => "delete_articles_under_" + cat.id.to_s, :description => "Empty"}
end

priviledges << {:name => "edit_top_category", :description => "Empty"}
priviledges << {:name => "delete_all_categories", :description => "Empty"}
priviledges << {:name => "add_articles_anywhere", :description => "Empty"}
priviledges << {:name => "edit_articles_anywhere", :description => "Empty"}
priviledges << {:name => "delete_articles_anywhere", :description => "Empty"}
priviledges << {:name => "user_management", :description => "Empty"}
priviledges << {:name => "edit_lesson_table", :description => "Empty"}

priviledges.each do |priviledge|
  Priviledge.create!(priviledge)
end

users = [
         {:name => "user_1", :studentID => "2012012429"},
         {:name => "user_2", :studentID => "2012012428"},
         {:name => "user_3", :studentID => "2012012427"}
        ]

users.each do |user|
  User.create!(user)
end

links = Array.new
(1..priviledges.size()).each do |x|
  links << {:priviledge_id => x, :user_id => 1}
end

(1..5).each do |x|
  links << {:priviledge_id => x, :user_id => 2}
end

links.each do |item|
  priviledge = Priviledge.find_by_id(item[:priviledge_id])
  user = User.find_by_id(item[:user_id])
  priviledge.users << user
  user.priviledges << priviledge
  priviledge.save!
  user.save!
end


