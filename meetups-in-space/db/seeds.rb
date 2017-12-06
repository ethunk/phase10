# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Example:
#
#   Person.create(first_name: 'Eric', last_name: 'Kelly')
Meetup.create({
  name: 'Code Jam Sesh',
  description: 'Come and code with some peeeps for the evening',
  location: 'Starbucks near Alewife',
  date: 'December 5th, 2017',
  start_time: '6:30pm',
  end_time: '11:30pm',
  })

Meetup.create({
  name: 'Sweet 16 for Cory',
  description: 'Come and celebrate Corys Bday',
  location: 'Dave and Busters',
  date: 'December 10th, 2017',
  start_time: '6:30pm',
  end_time: '11:30pm',
  })

Meetup.create({
  name: 'XOXO Valentines Dance',
  description: 'Bring a date and your best dance moves',
  location: 'TD Garden',
  date: 'February 14th, 2017',
  start_time: '6:30pm',
  end_time: '11:30pm',
  }) 
