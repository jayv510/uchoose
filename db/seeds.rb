# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Deleting any existing users ..."
Prospective.delete_all
Mentor.delete_all

major_categories = ["Agriculture & Natural Resources","Arts","  Biology & Life Science","Business","Communications & Journalism","Computers & Mathematics","Education","Engineering","Health","Humanities & Liberal Arts","Industrial Arts & Consumer Services","Interdisciplinary","Law & Public Policy","Physical Sciences","Psychology & Social Work","Social Science"]
majors = ["PLANT SCIENCE AND AGRONOMY", "BIOCHEMICAL SCIENCES", "BUSINESS MANAGEMENT AND ADMINISTRATION", "MATHEMATICS AND COMPUTER SCIENCE", "ARCHITECTURAL ENGINEERING", "PHARMACY PHARMACEUTICAL SCIENCES AND ADMINISTRATION", "ENGLISH LANGUAGE AND LITERATURE", "PUBLIC POLICY", "ECONOMICS", "INTERNATIONAL RELATIONS"]
degree_levels = ["Diploma", "Associates", "Bachelors", "Honours", "Masters", "Doctoral", "Post-doctoral"]
avatars = [
  "https://res.cloudinary.com/uchoose/image/upload/v1543474940/u4achirktcktynzdw1ua.jpg",
  "https://res.cloudinary.com/uchoose/image/upload/v1543474030/kss4t0poocsen4vc6qxe.jpg",
  "https://res.cloudinary.com/uchoose/image/upload/v1543473567/lalmmlaqismleae9g4d3.jpg",
  "https://res.cloudinary.com/uchoose/image/upload/v1543466172/cwxzcxqke0d53ktwe1ct.jpg",
  "https://res.cloudinary.com/uchoose/image/upload/v1543494350/man_3.jpg",
  "https://res.cloudinary.com/uchoose/image/upload/v1543494349/man_4.jpg",
  "https://res.cloudinary.com/uchoose/image/upload/v1543494348/man_5.jpg",
  "https://res.cloudinary.com/uchoose/image/upload/v1543494348/man_11.jpg",
  "https://res.cloudinary.com/uchoose/image/upload/v1543494348/man_7.jpg",
  "https://res.cloudinary.com/uchoose/image/upload/v1543494348/man_10.jpg",
  "https://res.cloudinary.com/uchoose/image/upload/v1543494346/man_19.jpg",
  "https://res.cloudinary.com/uchoose/image/upload/v1543494346/man_15.jpg",
  "https://res.cloudinary.com/uchoose/image/upload/v1543494346/man_20.jpg",
  "https://res.cloudinary.com/uchoose/image/upload/v1543494346/man_18.jpg",
  "https://res.cloudinary.com/uchoose/image/upload/v1543494346/man_22.jpg"]


puts "Generating fake mentors ..."

100.times do
  Mentor.create(
    email: Faker::Internet.email,
    password: "123456",
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    nationality: Faker::Address.country,
    university: Faker::University.name,
    major_category: major_categories.sample,
    major: majors.sample.titleize,
    degree_level: degree_levels.sample,
    description: Faker::Lorem.paragraph(10, true, 5),
    description_two: Faker::Lorem.paragraph(5, true, 3),
    remote_photo_url: avatars.sample)
end

Mentor.create(
  email: "mentor@test.com",
  password: "123456",
  first_name: "Monica",
  last_name: "Mentor",
  nationality: Faker::Address.country,
  university: Faker::University.name,
  major_category: major_categories.sample,
  major: majors.sample.titleize,
  degree_level: degree_levels.sample,
  description: Faker::Lorem.paragraph(10, true, 5),
  description_two: Faker::Lorem.paragraph(5, true, 3),
  remote_photo_url: avatars.sample)

# mentor_start_id = Mentor.last.id - Mentor.count + 1
# mentor_end_id = Mentor.last.id
# mentor_id_sample = *(mentor_start_id..mentor_end_id)


puts "Generating fake prospectives ..."

5.times do
  Prospective.create(
    email: Faker::Internet.email,
    password: "123456",
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    nationality: Faker::Address.country,
    remote_photo_url: avatars.sample)
end

Prospective.create(
  email: "prospective@test.com",
  password: "123456",
  first_name: "Peter",
  last_name: "Prospective",
  nationality: Faker::Address.country,
  remote_photo_url: avatars.sample)

# prospective_start_id = Prospective.last.id - Prospective.count + 1
# prospective_end_id = Prospective.last.id
# prospective_id_sample = *(prospective_start_id..prospective_end_id)


puts "Seeding complete."


