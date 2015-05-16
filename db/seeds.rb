# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Event.create([
  { 
    name: "DjangoFest2015", 
    description: "Getting djiggy with django!", 
    event_time: "2015-08-02 09:00:00 EST", 
    location: "iStrategyLabs",
    link: "http://istrategylabs.com"
  },
  { 
    name: "Women Who Code Hackathon", 
    description: "Come hack on your code projects with cool female devs.", 
    event_time: "2015-07-24 18:00:00 EST", 
    location: "WeWork Shaw",
    link: "http://wework.com"
  },
    { 
    name: "Rails Hack Night", 
    description: "Lightning talks featuring Rails projects, followed by work time. Beginners welcome!", 
    event_time: "2015-07-07 19:30:00 EST", 
    location: "iStrategyLabs",
    link: "http://istrategylabs.com"
  },
    { 
    name: "Code and Coffee", 
    description: "BYO-Projects and laptops for a fun, informal way to learn, code and work on projects with other members in the community.", 
    event_time: "2015-06-15 14:00:00 EST", 
    location: "Compass Coffee",
    link: "http://www.meetup.com/Women-Who-Code-DC/"
  },
])
