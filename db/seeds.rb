# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

@user=User.create(
    [
      { email: "user123@email.com", password: "user123", password_confirmation: "user123", full_name: "Torres", mobile_phone: "98765987" }
    ])
  

# @post=Post.create([
#     {
#         full_name: "John Carter",
#         age: 22,
#         location: "Tempanies",
#         description: "Wearing Red Tshirt when leaving home",
#         special_note: "Person with disability and elderly",
#         image_data: "nana",
#         missing_time: "2023-07-13 18:17:52.388644000 +0000",
#         user_id: 2
#     }
# ])


