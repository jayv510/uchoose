puts "Deleting any existing users and reviews..."
ReviewMentor.delete_all
Prospective.delete_all
Mentor.delete_all

# -------------------------------AVATARS--------------------------

male_avatars = ["https://res.cloudinary.com/uchoose/image/upload/v1543474940/u4achirktcktynzdw1ua.jpg",
  "https://res.cloudinary.com/uchoose/image/upload/v1543474030/kss4t0poocsen4vc6qxe.jpg",
  "https://res.cloudinary.com/uchoose/image/upload/v1543494350/man_3.jpg",
  "https://res.cloudinary.com/uchoose/image/upload/v1543494346/man_20.jpg",
  "https://res.cloudinary.com/uchoose/image/upload/v1543494346/man_18.jpg",
]

female_avatars = ["https://res.cloudinary.com/uchoose/image/upload/v1543473567/lalmmlaqismleae9g4d3.jpg",
  "https://res.cloudinary.com/uchoose/image/upload/v1543466172/cwxzcxqke0d53ktwe1ct.jpg",
  "https://res.cloudinary.com/uchoose/image/upload/v1543494349/man_4.jpg",
  "https://res.cloudinary.com/uchoose/image/upload/v1543494348/man_5.jpg",
  "https://res.cloudinary.com/uchoose/image/upload/v1543494348/man_11.jpg",
  "https://res.cloudinary.com/uchoose/image/upload/v1543494348/man_7.jpg",
  "https://res.cloudinary.com/uchoose/image/upload/v1543494348/man_10.jpg",
  "https://res.cloudinary.com/uchoose/image/upload/v1543494346/man_19.jpg",
  "https://res.cloudinary.com/uchoose/image/upload/v1543494346/man_15.jpg",
  "https://res.cloudinary.com/uchoose/image/upload/v1543494346/man_22.jpg"
]

# --------------------------DEGREE LEVELS----------------------------

degree_levels = ["Diploma", "Associate's", "Bachelor's", "Honours", "Master's", "Doctoral", "Post-doctoral"]

# ------------------MAJORS AND MAJORS CATEGORIES----------------------

csv_options = { col_sep: ',', quote_char: '"', headers: :first_row }
filepath    = 'app/assets/data/MajorsData.csv'
majors = []
CSV.foreach(filepath, csv_options) do |row|
   major = "#{row['Major']}%#{row['Major_Category']}"
   majors << major
end

# -----------------------UNIVERSITY NAMES------------------------------

csv_options = { col_sep: ',', quote_char: '"', headers: :first_row }
filepath    = 'app/assets/data/UniversityData.csv'
university_name = []
CSV.foreach(filepath, csv_options) do |row|
   university_name << row['Name']
end

# --------------------------COUNTRIES----------------------------

countries = ["U.S.A", "U.S.A", "U.S.A", "U.S.A", "U.S.A", "China", "China", "China", "India", "India", "South Korea", "Saudi Arabia", "Canada", "Vietnam", "Taiwan", "Japan", "Mexico", "Brazil", "Nepal", "Iran", "Nigeria", "United Kingdom", "Turkey", "Kuwait", "Germany", "France", "Indonesia", "Venezuela", "Malaysia", "Colombia", "Pakistan", "Bangladesh", "Spain"]


# -------------------------MENTORS--------------------------------------

puts "Generating fake male mentors ..."

50.times do
  random = rand(173)-1

  Mentor.create(
  email: Faker::Internet.email,
  password: "123456",
  first_name: Faker::Name.male_first_name,
  last_name: Faker::Name.last_name,
  nationality: countries.sample,
  university: university_name.sample,
  major_category: majors[random].split('%')[1],
  major: majors[random].split('%')[0].titleize,
  degree_level: degree_levels.sample,
  description: Faker::Lorem.paragraph(10, true, 5),
  description_two: Faker::Lorem.paragraph(5, true, 3),
  remote_photo_url: male_avatars.sample,
  rate: (3..12).to_a.sample)
end

puts "Generating fake female mentors ..."

50.times do
  random = rand(173)-1

  Mentor.create(
  email: Faker::Internet.email,
  password: "123456",
  first_name: Faker::Name.female_first_name,
  last_name: Faker::Name.last_name,
  nationality: countries.sample,
  university: university_name.sample,
  major_category: majors[random].split('%')[1],
  major: majors[random].split('%')[0].titleize,
  degree_level: degree_levels.sample,
  description: Faker::Lorem.paragraph(10, true, 5),
  description_two: Faker::Lorem.paragraph(5, true, 3),
  remote_photo_url: female_avatars.sample,
  rate: (3..12).to_a.sample)
end

puts "Generating fake mentors for NYU ..."

15.times do
  random = rand(173)-1

  Mentor.create(
  email: Faker::Internet.email,
  password: "123456",
  first_name: Faker::Name.male_first_name,
  last_name: Faker::Name.last_name,
  nationality: countries.sample,
  university: 'New York University',
  major_category: majors[random].split('%')[1],
  major: majors[random].split('%')[0].titleize,
  degree_level: degree_levels.sample,
  description: Faker::Lorem.paragraph(10, true, 5),
  description_two: Faker::Lorem.paragraph(5, true, 3),
  remote_photo_url: male_avatars.sample,
  rate: (3..12).to_a.sample)
end

puts "Generating fake female mentors ..."

15.times do
  random = rand(173)-1

  Mentor.create(
  email: Faker::Internet.email,
  password: "123456",
  first_name: Faker::Name.female_first_name,
  last_name: Faker::Name.last_name,
  nationality: countries.sample,
  university: 'New York University',
  major_category: majors[random].split('%')[1],
  major: majors[random].split('%')[0].titleize,
  degree_level: degree_levels.sample,
  description: Faker::Lorem.paragraph(10, true, 5),
  description_two: Faker::Lorem.paragraph(5, true, 3),
  remote_photo_url: female_avatars.sample,
  rate: (3..12).to_a.sample)
end


Mentor.create(
  email: "mentor@test.com",
  password: "123456",
  first_name: "Monica",
  last_name: "Mentor",
  nationality: countries.sample,
  university: university_name.sample,
  major_category: majors[rand(172)-1].split('%')[1],
  major: majors[rand(172)-1].split('%')[0].titleize,
  degree_level: degree_levels.sample,
  description: Faker::Lorem.paragraph(10, true, 5),
  description_two: Faker::Lorem.paragraph(5, true, 3),
  remote_photo_url: female_avatars.sample)

# ---------------------PROSPECTIVES-------------------------------------------

puts "Generating fake prospectives ..."

30.times do
  Prospective.create(
    email: Faker::Internet.email,
    password: "123456",
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    nationality: countries.sample,
    remote_photo_url: male_avatars.sample)
end

Prospective.create(
  email: "prospective@test.com",
  password: "123456",
  first_name: "Peter",
  last_name: "Prospective",
  nationality: countries.sample,
  remote_photo_url: male_avatars.sample)

Prospective.create(
  email: "jay@uchoose.com",
  password: "123456",
  first_name: "Jay",
  last_name: "Vajanopath",
  nationality: "Thailand",
  remote_photo_url: male_avatars.sample)

# ----------------------REVIEWS--------------------------------------------------

mentor_start_id = Mentor.last.id - Mentor.count + 1
mentor_end_id = Mentor.last.id
mentor_id_sample = *(mentor_start_id..mentor_end_id)
prospective_start_id = Prospective.last.id - Prospective.count + 1
prospective_end_id = Prospective.last.id
prospective_id_sample = *(prospective_start_id..prospective_end_id)

puts "Generating fake reviews ..."

1000.times do
  ReviewMentor.create(
    content: ["Very good talk, thank you", "Excellent", "Very helpful", "Great help", "Gives really good advice!", "Really informative sessions and very helpful!", "very very helpful, explains things very clearly", "Very informative, willing to do extra to help you understand", "Great help", "Recommended!", "Great experience!", "Affordable and helpful", "Very friendly", "Nice chat!", "Very happy with the experience.", "Would recommend to friends", "Good conversation!", "Satisfied with the answers!", "Thank you for the information!"].sample,
    rating: (3..5).to_a.sample,
    mentor_id: mentor_id_sample.sample,
    prospective_id: prospective_id_sample.sample)
  end

puts "Seeding complete."
