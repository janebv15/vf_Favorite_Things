# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

 Category.destroy_all
 Category.create({ :name => "Books",  :max_items => 5 })
 Category.create({ :name => "Movies", :max_items => 5 })
 Category.create({ :name => "TV Shows",  :max_items => 5 })
 Category.create({ :name => "Songs",  :max_items => 5 })
 Category.create({ :name => "Vacations",  :max_items => 5 })
 Category.create({ :name => "Misc.",  :max_items => 5 })
