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

start_id = User.last.id - User.count + 1
end_id = User.last.id
user_id_sample = *(start_id..end_id)

major_categories = ["Agriculture & Natural Resources","Arts","  Biology & Life Science","Business","Communications & Journalism","Computers & Mathematics","Education","Engineering","Health","Humanities & Liberal Arts","Industrial Arts & Consumer Services","Interdisciplinary","Law & Public Policy","Physical Sciences","Psychology & Social Work","Social Science"]
majors = ["PLANT SCIENCE AND AGRONOMY", "BIOCHEMICAL SCIENCES", "BUSINESS MANAGEMENT AND ADMINISTRATION", "MATHEMATICS AND COMPUTER SCIENCE", "ARCHITECTURAL ENGINEERING", "PHARMACY PHARMACEUTICAL SCIENCES AND ADMINISTRATION", "ENGLISH LANGUAGE AND LITERATURE", "PUBLIC POLICY", "ECONOMICS", "INTERNATIONAL RELATIONS"]
degree_levels = ["Undergraduate", "Honours", "Masters", "Doctoral", "Post-doctoral", "Other"]



puts "Generating fake mentors ..."

20.times do
  Mentor.create(
    email: Faker::Internet.email,
    password: "123456",
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    nationality: Faker::Nation.nationality,
    university: Faker::University.name,
    major_category: major_categories.sample,
    major: majors.sample.titleize,
    degree_level: degree_levels.sample,
    description: Faker::Lorem.paragraph)
end

Mentor.create(
  email: "mentor@test.com",
  password: "123456",
  first_name: "Monica",
  last_name: "Mentor",
  nationality: Faker::Nation.nationality,
  university: Faker::University.name,
  major_category: major_categories.sample,
  major: majors.sample.titleize,
  degree_level: degree_levels.sample,
  description: Faker::Lorem.paragraph)



puts "Generating fake prospectives ..."

5.times do
  Prospective.create(
    email: Faker::Internet.email,
    password: "123456",
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    nationality: Faker::Nation.nationality)
end

Prospective.create(
  email: "prospective@test.com",
  password: "123456",
  first_name: "Peter",
  last_name: "Prospective",
  nationality: Faker::Nation.nationality)



puts "Seeding complete."


