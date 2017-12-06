require 'spec_helper'
require 'orderly'
feature "user views details of a meetup" do
  # As a user
  # I want to view the details of a meetup
  # So that I can learn more about its purpose
  # Acceptance Criteria:
  #
  # On the index page, the name of each meetup should be a link to the meetup's
  # show page. On the show page, I should see the name, description, location,
  # and the creator of the meetup.

  describe 'On index page, the name of each meetup should be a link to the meetups show page' do

    let(:meetup_one) {Meetup.create({
      name: 'Code Jam Sesh',
      description: 'Come and code with some peeeps for the evening',
      location: 'Starbucks near Alewife',
      date: 'December 5th, 2017',
      start_time: '6:30pm',
      end_time: '11:30pm',
      })
    }
    binding.pry
    let(:meetup_two) {Meetup.create({
      name: 'Sweet 16 for Cory',
      description: 'Come and celebrate Corys Bday',
      location: 'Dave and Busters',
      date: 'December 10th, 2017',
      start_time: '6:30pm',
      end_time: '11:30pm',
      })
    }
    binding.pry
    let(:meetup_three) {Meetup.create({
      name: 'XOXO Valentines Dance',
      description: 'Bring a date and your best dance moves',
      location: 'TD Garden',
      date: 'February 14th, 2017',
      start_time: '6:30pm',
      end_time: '11:30pm',
      })
    }
    binding.pry
    it 'displays meetups' do
      binding.pry
      meetup_one
      meetup_two
      meetup_three
      visit '/'
      expect(page).to have_content('Code Jam Sesh')
      expect(page).to have_content('Sweet 16 for Cory')
      expect(page).to have_content('XOXO Valentines Dance')
    end

    # it 'contains an anchor for each meetup and the anchor href is for the show page' do
    #   # @meetups = Meetup.all.order(name: :asc)
    #   # binding.pry
    #   # items = page.find_all('li')
    #   # items.each_with_index do |item, index|
    #     # binding.pry
    #     # expect(item.find('a')[:href]).to have_content("show/#{@meetups[index].id}")
    #   # end
    #
    #   # binding.pry
    # end
  end
end
