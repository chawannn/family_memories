# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Admin.create!(email: "", password: "")

families = [
  [
    {
      email: "yamada@test.com",
      password: "yamadadayo",
      name: "山田　太郎",
      name_hiragana: "やまだ　たろう",
      birthday: "1960/10/10",
      nickname: "ヤンマー",
      blood_type: :B,
      letter_color: "#01e3f4",
    },
    {
      email: "yamada_a@test.com",
      password: "yamada_a",
      name: "山田　悦子",
      name_hiragana: "やまだ　えつこ",
      birthday: "1961/12/12",
      nickname: "えっちゃん",
      blood_type: :AB,
      letter_color: "#f0f8ff",
    },
    {
      email: "yamada_b@test.com",
      password: "yamada_b",
      name: "山田　瑠衣",
      name_hiragana: "やまだ　るい",
      birthday: "1995/12/12",
      nickname: "シャチ",
      blood_type: :B,
      letter_color: "#008b8b",
    },
  ],
  [
    {
      email: "tanaka@test.com",
      password: "tanakanaka",
      name: "田中　春馬",
      name_hiragana: "たなか　はるま",
      birthday: "1954/03/31",
      nickname: "田中",
      blood_type: :O,
      letter_color: "#ff4500",
    },
    {
      email: "tanaka_a@test.com",
      password: "tanaka_a",
      name: "田中　幹子",
      name_hiragana: "たなか　みきこ",
      birthday: "1963/12/12",
      nickname: "幹ちゃん",
      blood_type: :O,
      letter_color: "#f5deb3",
    },
    {
      email: "tanaka_b@test.com",
      password: "tanaka_b",
      name: "田中　貴和子",
      name_hiragana: "たなか　きわこ",
      birthday: "1985/10/10",
      nickname: "たらこ",
      blood_type: :O,
      letter_color: "#708090",
    },
    {
      email: "tanaka_c@test.com",
      password: "tanaka_c",
      name: "田中　天馬",
      name_hiragana: "たなか　てんま",
      birthday: "1998/12/12",
      nickname: "ペガサス",
      blood_type: :O,
      letter_color: "#c71585",
    },
  ],
  [
    {
      email: "arerenore@test.com",
      password: "arerenore",
      name: "橘　蒼",
      name_hiragana: "たちばな　あおい",
      birthday: "1980/05/15",
      nickname: "あおし",
      blood_type: :AB,
      letter_color: "#f0e68c",
    },
    {
      email: "rerere@test.com",
      password: "rererenore",
      name: "橘　京子",
      name_hiragana: "たちばな　きょうこ",
      birthday: "1985/10/21",
      nickname: "京ちゃん",
      blood_type: :AB,
      letter_color: "#191970",
    },
    {
      email: "wawawa@test.com",
      password: "wawawawa",
      name: "橘　凛",
      name_hiragana: "たちばな　りん",
      birthday: "2005/09/23",
      nickname: "りんさん",
      blood_type: :A,
      letter_color: "#ff69b4",
    },
    {
      email: "awawa@test.com",
      password: "awawawawa",
      name: "橘　樹",
      name_hiragana: "たちばな　いつき",
      birthday: "2010/07/25",
      nickname: "いっちゃん",
      blood_type: :B,
      letter_color: "#66cdaa",
    },
  ],
  [
    {
      email: "popopo@test.com",
      password: "popopopo",
      name: "高木　大吾",
      name_hiragana: "たかぎ　だいご",
      birthday: "2000/08/04",
      nickname: "だいしん",
      blood_type: :B,
      letter_color: "#ffd700",
    },
    {
      email: "papapa@test.com",
      password: "papapapa",
      name: "高木　結衣",
      name_hiragana: "たかぎ　ゆい",
      birthday: "2004/06/18",
      nickname: "ゆっぴん",
      blood_type: :B,
      letter_color: "#8fbc8f",
    },
    {
      email: "pipipi@test.com",
      password: "pipipipi",
      name: "高木　大五郎",
      name_hiragana: "たかぎ　だいごろう",
      birthday: "2023/01/19",
      nickname: "ごっちん",
      blood_type: :O,
      letter_color: "#dcdcdc",
    },
  ],
  [
    {
      email: "fufufu@test.com",
      password: "fufufufu",
      name: "青木　元治",
      name_hiragana: "あおき　げんじ",
      birthday: "1970/02/28",
      nickname: "げんさん",
      blood_type: :B,
      letter_color: "#66cdaa",
    },
    {
      email: "ufufu@test.com",
      password: "ufufufufu",
      name: "青木　美奈代",
      name_hiragana: "あおき　みなよ",
      birthday: "1970/05/01",
      nickname: "みなよ",
      blood_type: :A,
      letter_color: "#1e90ff",
    },
  ],
]

puts "--> Family start"

families.each do |members|
  print "##-->> Member start"
  members.each.with_index do |member, i|
    members = []
    if i == 0
      @owner = Member.create!(member)
      @owner.image.attach(io: File.open(Rails.root.join("db/fixtures/img#{rand(0..4)}.jpg")), filename: "img.jpg")
      print "."
    else
      member = Member.new(member)
      member.invited_by_id = @owner.id
      member.image.attach(io: File.open(Rails.root.join("db/fixtures/img#{rand(0..4)}.jpg")), filename: "img.jpg")
      member.save!
      print "."
      members << member
    end
  end
  puts "end"
end

puts "Family end"

puts "--> Event start"

create_members = []

create_members << Member.find_by(email: "yamada@test.com")
create_members <<  Member.find_by(email: "yamada_a@test.com")

events = [
  {
    title: "event1",
    body: "eventeventevent",
    images: [
      "img0.jpg",
      "img1.jpg"
    ]
  },
  {
    title: "event2",
    body: "eventeventevent",
    images: [
      "img4.jpg"
    ]
  },
  {
    title: "event3",
    body: "eventeventevent",
    images: [
      "img4.jpg"
    ]
  },
  {
    title: "event4",
    body: "eventeventevent",
    images: [

    ]
  },
  {
    title: "event4",
    body: "eventeventevent",
    images: [

    ]
  },
]

print "##-->> Event start"

events.each.with_index(1) do |data, i|
  event = create_members.sample.events.new(title: data[:title], body: data[:body])
  event.start_time = Time.zone.now.since((i * rand(1..3)).day)
  event.save!
  if data[:images].any?
    data[:images].each do |image|
      event.images.attach(io: File.open(Rails.root.join("db/fixtures/#{image}")), filename: "#{image}")
    end
  end

  print "."
end

puts "Event end"


puts "--> EvantMember start"

events = Event.where(id: (1..3).to_a)

print "##--> EventMember start"

events.each do |event|
  families = event.member.families
  families.sample(rand(1..families.size)).each do |member|
    event.event_members.create!(
      member_id: member.id,
      is_done: [true, false].sample,
      is_nice: [true, false].sample
    )
    print "."
  end
end

puts "EventMember end"
