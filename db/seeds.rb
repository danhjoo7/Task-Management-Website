# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


priority = ["Low", "Medium", "High", "Immediate Action Required"]
category = ["Cleaning", "Shopping/Supplies", "Reservations", "Reimbursements", "Maintenance"]

20.times do 
    Task.create(
        assignee_id: rand(1..10),
        assigner_id: rand(1..10),
        title:  Faker::House.room,
        category: category.sample,
        priority: priority.sample,
        content: Faker::House.furniture 
    )
end