require 'spec_helper'
require 'orderly'
require 'rails-helper'
require 'faker'


feature 'user can view a list of attendees' do
# As a user
# I want to see who has already joined a meetup
# So that I can see if any of my friends have joined
# Acceptance Criteria:
#
# On a meetup's show page, I should see a list of the members that have joined the meetup.
# I should see each member's avatar and username.

  before :each do
  meetup_one = Meetup.create(
    name: 'Code Jam Sesh',
    description: 'Come and code with some peeeps for the evening',
    location: 'Starbucks near Alewife',
    date: 'December 5th, 2017',
    start_time: '6:30pm',
    end_time: '11:30pm')

  meetup_two = Meetup.create(
    name: 'Sweet 16 for Cory',
    description: 'Come and celebrate Corys Bday',
    location: 'Dave and Busters',
    date: 'December 10th, 2017',
    start_time: '6:30pm',
    end_time: '11:30pm'
    )

  meetup_three = Meetup.create(
    name: 'XOXO Valentines Dance',
    description: 'Bring a date and your best dance moves',
    location: 'TD Garden',
    date: 'February 14th, 2017',
    start_time: '6:30pm',
    end_time: '11:30pm'
    )

    10.times do
      temp = Faker::Omniauth.github
      User.create(
        provider: temp[:provider],
        uid: temp[:uid],
        username: temp[:extra][:raw_info][:login],
        email: temp[:extra][:raw_info][:email],
        avatar_url: temp[:extra][:raw_info][:avatar_url]
      )
    end

    15.times do
      Attendee.create(
        meetup_id: Faker::Number.between(1,3),
        user_id: Faker::Number.between(1,10)
      )
    end

    [1,2,3].each do |id|
      temp = Attendee.where("meetup_id = #{id}")[0]
      temp.creator = true
      temp.save
    end

end

  it 'on a show page have a table of the users attending and avatar images' do
    visit '/'
    click_link('Code Jam Sesh')
    id = page.current_path.match(/\d+/)[0]
    expect(page).to have_content("User's Attending:")
    expect(page).to have_css("img")
  end

end
