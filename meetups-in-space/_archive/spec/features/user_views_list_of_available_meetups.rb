require 'spec_helper'
require 'orderly'
feature "user views list of available meetups" do
 # As a user
 # I want to view a list of all available meetups
 # So that I can get together with people with similar interests

 # Acceptance Criteria:
 # On the meetups index page, I should see the name of each meetup.
 # Meetups should be listed alphabetically.

  describe 'User views meetups page, meetups listed alphabetically' do
    let(:meetup_one) {Meetup.create({
      name: 'Code Jam Sesh',
      description: 'Come and code with some peeeps for the evening',
      location: 'Starbucks near Alewife',
      date: 'December 5th, 2017',
      start_time: '6:30pm',
      end_time: '11:30pm',
      })
    }
    let(:meetup_two) {Meetup.create({
      name: 'Sweet 16 for Cory',
      description: 'Come and celebrate Corys Bday',
      location: 'Dave and Busters',
      date: 'December 10th, 2017',
      start_time: '6:30pm',
      end_time: '11:30pm',
      })
    }
    let(:meetup_three) {Meetup.create({
      name: 'XOXO Valentines Dance',
      description: 'Bring a date and your best dance moves',
      location: 'TD Garden',
      date: 'February 14th, 2017',
      start_time: '6:30pm',
      end_time: '11:30pm',
      })
    }

    it 'has a link for each meetup' do
      meetup_one
      meetup_two
      meetup_three
      visit '/'
      expect(page.find_all('a').count).to equal(3)

    end

    # it 'each link is to the id of the meetup' do
    #
    # end

  end

end
