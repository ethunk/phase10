require 'spec_helper'
require 'orderly'
require 'rails-helper'
require 'faker'

feature 'user views details of a meetup' do

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
          meetupid: Faker::Number.between(1,3),
          userid: Faker::Number.between(1,10)
        )
      end

      [1,2,3].each do |id|
        temp = Attendee.where("meetupid = #{id}")[0]
        temp.creator = true
        temp.save
      end

  end
  # As a user
  # I want to view the details of a meetup
  # So that I can learn more about its purpose
  # Acceptance Criteria:
  #
  # [ ] On the index page, the name of each meetup should be a link to the meetup's show page.
  # [ ] On the show page, I should see the name, description, location, and the creator of the meetup.


  it 'user navigates to homepage and see a list of meetups' do
    visit '/'
    click_on("#{Meetup.first.name}")
    id = page.current_path.match(/\d+/)[0]
    meetup = Meetup.where('id = ?', id)[0]
    expect(page).to have_content('Location: ' + "#{meetup.location}")
    expect(page).to have_content("Description: #{meetup.description}")
    expect(page).to have_content("#{meetup.name}")
    expect(page).to have_content("Date: 2017-12-05")
    expect(page).to have_content("Start Time: 06:30 PM")
    expect(page).to have_content("End Time: 11:30 PM")
    # expect(page).to have_content("")
  end

end
