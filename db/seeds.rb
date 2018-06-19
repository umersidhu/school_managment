# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#super_admin

User.create(first_name: "Sheharyar", last_name: "Ajmal", email: "isheharyarajmal18@gmail.com", role: User.roles[:admin], mobile_number: "03065447404", password: "123456", password_confirmation: "123456")
User.create(first_name: "sherry", last_name: "ajml", email: "sherry@gmail.com", role: User.roles[:school_admin], mobile_number: "03204159414", password: "123456", password_confirmation: "123456")