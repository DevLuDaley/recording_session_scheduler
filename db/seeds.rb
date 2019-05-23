# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'database_cleaner'

DatabaseCleaner.clean_with(:truncation)


artists = Artist.create([{ name: 'Coach' },

{ name: 'Vybz Kartel' },

{ name: 'Biggie' },

{ name: 'Janis Joplin' },

{ name: 'Nas' },

{ name: 'Coldplay' },

{ name: 'Prince' },

{ name: '112' },

{ name: 'Maroon 5' },

{ name: 'Bob Marley' },

{ name: 'J.Cole' },

{ name: 'Foster The People' },

{ name: 'Eve' },

{ name: 'Jimi' },

{ name: 'Shaq' },

{ name: 'Frank Ocean' },

{ name: 'Kendrick' },

{ name: 'Gwen' }])



studios = Studio.create([{name: "Fancy Closet", location: 'Harlem, New York'},

{name: "Quad Studios", location: 'Brooklyn, New York'},

{name: "The Max", location: 'Harlem, New York'},

{name: "THe Boom Boom Room", location: 'Harlem, New York'},

{name: "The Block", location: 'Queens, New York'},

{name: "Hit Factory", location: 'Staten Island, New York'},

{name: "Glass Cage of Emotion", location: 'Bronx, New York'},

{name: "Beat Farm", location: 'Harlem, New York'},

{name: "Grandma's Basement", location: 'Harlem, New York'}])



engineers = Engineer.create([{email: "lu@lu.com", name: "Lu"},

    {email: "nikki@nikki.com", name: "Nikki Daley"},

{email: "young@guru.com", name: "Young Guru"},

{email: "stush@stush.com", name: "Stush"},

{email: "bodega@bodega.com", name: "Bodega Dude"},

{email: "dre@dre.com", name: "Dr. Dre"},

{email: "hot@hot.com", name: "Hot Pie"},

{email: "timbo@timbo.com", name: "Timbaland"},

{email: "Winslow@Winslow.com", name: "Officer Winslow"},

{email: "rick@rick.com", name: "Rick Ruben"},


{email: "gilly@gilly.com", name: "Gilly"},

{email: "teddy@teddy.com", name: "Teddy Riley"}])



#([{ name: 'Lu'}, {name: 'Stush'}, {name: 'Podrick'}, {name: 'Arya'}, {name: 'Teddy'}])
#RecordingSession.create(appointment_date: '6.1.2019', engineer: Engineer.first, studio: Studio.first, artist: Artist.first )
RecordingSession.create(appointment_date: '7.3.2019', engineer_id: engineers[0], studio_id: studios[0], artist_id: artists[0])

RecordingSession.create(appointment_date: '19.7.2019', engineer_id: engineers[5], studio_id: studios[5], artist_id: artists[5])

RecordingSession.create(appointment_date: '27.7.2019', engineer_id: engineers[1], studio_id: studios[1], artist_id: artists[1])

RecordingSession.create(appointment_date: '14.7.2019', engineer_id: engineers[5], studio_id: studios[7], artist_id: artists[6])

RecordingSession.create(appointment_date: '21.7.2019', engineer_id: engineers[2], studio_id: studios[2], artist_id: artists[2])

RecordingSession.create(appointment_date: '23.7.2019', engineer_id: engineers[6], studio_id: studios[7], artist_id: artists[6])

RecordingSession.create(appointment_date: '24.7.2019', engineer_id: engineers[3], studio_id: studios[3], artist_id: artists[3])

RecordingSession.create(appointment_date: '17.7.2019', engineer_id: engineers[7], studio_id: studios[7], artist_id: artists[7])

RecordingSession.create(appointment_date: '16.7.2019', engineer_id: engineers[4], studio_id: studios[4], artist_id: artists[4])

RecordingSession.create(appointment_date: '12.7.2019', engineer_id: engineers[6], studio_id: studios[1], artist_id: artists[2])