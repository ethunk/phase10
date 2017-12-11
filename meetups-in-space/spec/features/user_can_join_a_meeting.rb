require 'spec_helper'
require 'orderly'
require 'rails-helper'
require 'faker'


feature 'user can join a meeting' do

# As a user
# I want to join a meetup
# So that I can partake in this meetup
# Acceptance Criteria:
#
# On a meetup's show page, there should be a button to join the meetup if I am not signed in or if I am signed in, but I am not a member of the meetup.
# If I am signed in and I click the button, I should see a message that says that I have joined the meetup and I should be added to the meetup's members list.
# If I am not signed in and I click the button, I should see a message which says that I must sign in.

  let(:user) do
    User.create(
      provider: "github",
      uid: "1",
      username: "jarlax1",
      email: "jarlax1@launchacademy.com",
      avatar_url: "https://avatars2.githubusercontent.com/u/174825?v=3&s=400"
    )
  end

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

  # it 'page will give error message if user is not signed in' do
  #   visit '/meetups/show/1'
  #   click_button('Submit')
  #   expect(page).to have_content("You must be signed in.")
  # end

  scenario 'user can join by clicking join and a confirmation message is given' do
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
    sign_in_as user
    visit '/meetups/show/1'
    click_button('Submit')
    expect(page).to have_content("You were sucessfully added")
  end

end
