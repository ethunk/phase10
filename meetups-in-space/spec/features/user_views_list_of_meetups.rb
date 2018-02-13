require 'spec_helper'
require 'orderly'
require 'rails-helper'

feature 'user views list of meetups' do

  before :each do
    meetup_one = Meetup.create(
      name: 'Code Jam Sesh',
      description: 'Come and code with some peeeps for the evening',
      location: 'Starbucks near Alewife',
      date: 'December 5th, 2017',
      start_time: '6:30pm',
      end_time: '11:30pm')

    meetup_two = Meetup.create(
      name: 'XOXO Valentines Dance',
      description: 'Bring a date and your best dance moves',
      location: 'TD Garden',
      date: 'February 14th, 2017',
      start_time: '6:30pm',
      end_time: '11:30pm'
      )

    meetup_three = Meetup.create(
      name: 'Sweet 16 for Cory',
      description: 'Come and celebrate Corys Bday',
      location: 'Dave and Busters',
      date: 'December 10th, 2017',
      start_time: '6:30pm',
      end_time: '11:30pm'
      )
  end
  # As a user
  # I want to view a list of all available meetups
  # So that I can get together with people with similar interests
  # Acceptance Criteria:
  #
  # [x] On the meetups index page, I should see the name of each meetup.
  # [x] Meetups should be listed alphabetically.

  it 'user navigates to homepage and see a list of meetups' do
    visit '/'
    expect(page.find_all('a').count).to equal(Meetup.all.count + 2)
    expect(page).to have_content('Code Jam Sesh')
    expect(page).to have_content('Sweet 16 for Cory')
    expect(page).to have_content('XOXO Valentines Dance')
    @meetups = Meetup.all.order(name: :asc)
    @meetups.each_with_index do |meetup, index|
      if index < @meetups.size-1
        expect(meetup.name).to appear_before(@meetups[index+1].name)
      end
    end
  end

end
