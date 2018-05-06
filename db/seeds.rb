# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#super_admin

User.create(first_name: "Umer", last_name: "Sidhu", email: "umersidhu876@gmail.com", role: User.roles[:admin], mobile_number: "03065447404", password: "123456", password_confirmation: "123456")
