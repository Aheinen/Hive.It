# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Competency.create(name: "Do", color: "#33CCFF") #light blue
Competency.create(name: "Watch", color: "#006600") #dark green
Competency.create(name: "Listen", color: "#FFFF00") #yellow
Competency.create(name: "Teach", color: "#FFA500") #orange
Competency.create(name: "Class", color: "#800080") #purple
Competency.create(name: "Group", color: "#FFC0CB") #pink
Competency.create(name: "Play", color: "#FF0000") #red
Competency.create(name: "Read", color: "#3366CC") #blue
Competency.create(name: "Perform", color: "#99FF99") #light green

Rhythm.create(name: "Daily Habit", color: "#000080") #navy
Rhythm.create(name: "Bursts", color: "#000000") #black
Rhythm.create(name: "Deep Dive", color: "#4B0082") #indigo
Rhythm.create(name: "Casual", color: "#003300") #forest green

# User.create(name: "Alex Heinen", email: "Alex@alex.com", city: "San Francisco", country: "USA")

# CompetencyUser.create(user_id: 1, competency_id: 1)
# CompetencyUser.create(user_id: 1, competency_id: 2)
# CompetencyUser.create(user_id: 1, competency_id: 3)

Question.create(inquiry: "How can I build stronger relationships at work?")
Question.create(inquiry: "How do I best go about learning Angular.js?")
Question.create(inquiry: "What does the new economy look like?")

