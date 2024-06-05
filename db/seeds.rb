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
      password: "password",
      name: "yamada",
      name_hiragana: "test",
      birthday: "2000/10/10",
      nickname: "test",
      blood_type: :b,
      letter_color: "#01e3f4"
    },
    { 
      email: "yamada_a@test.com",
      password: "password",
      name: "yamada_a",
      name_hiragana: "test1",
      birthday: "2020/12/12",
      nickname: "test1",
      blood_type: :a,
      letter_color: "#01e3f4",
    },
    { 
      email: "yamada_b@test.com",
      password: "password",
      name: "yamada_b",
      name_hiragana: "test1",
      birthday: "2020/12/12",
      nickname: "test1",
      blood_type: :a,
      letter_color: "#01e3f4",
    }
  ],
  [
    {    
      email: "tanaka@test.com",
      password: "password",
      name: "tanaka",
      name_hiragana: "test",
      birthday: "2000/10/10",
      nickname: "test",
      blood_type: :b,
      letter_color: "#01e3f4"
    },
    { 
      email: "tanaka_a@test.com",
      password: "password",
      name: "tanaka_a",
      name_hiragana: "test1",
      birthday: "2020/12/12",
      nickname: "test1",
      blood_type: :a,
      letter_color: "#01e3f4",
    },
    {    
      email: "tanaka_b@test.com",
      password: "password",
      name: "tanaka_b",
      name_hiragana: "test",
      birthday: "2000/10/10",
      nickname: "test",
      blood_type: :b,
      letter_color: "#01e3f4"
    },
    { 
      email: "tanaka_c@test.com",
      password: "password",
      name: "tanaka_c",
      name_hiragana: "test1",
      birthday: "2020/12/12",
      nickname: "test1",
      blood_type: :a,
      letter_color: "#01e3f4",
    }
  ],
]

families.each do |members|
  members.each.with_index do |member, i|
    members = []
    if i == 0
      @owner = Member.create!(member)
    else
      member = Member.new(member)
      member.invited_by_id = @owner.id
      member.save
      mambers << member
    end
  end
end


