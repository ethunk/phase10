require "spec_helper"

feature "user adds a new TV show" do
  # As a TV fanatic
  # I want to add one of my favorite shows
  # So that I can encourage others to binge watch it
  #
  # Acceptance Criteria:
  # * I must provide the title, network, and starting year.
  # * I can optionally provide the final year, genre, and synopsis.
  # * The synopsis can be no longer than 5000 characters.
  # * The starting year and ending year (if provided) must be
  #   greater than 1900.
  # * The genre must be one of the following: Action, Mystery,
  #   Drama, Comedy, Fantasy
  # * If any of the above validations fail, the form should be
  #   re-displayed with the failing validation message.

  scenario "successfully add a new show" do
    #user visits homepage
    visit "/television_shows"
    #user navigates to add new show page
    click_link('Add New Show')
    #user fills forms
    fill_in('Title', :with => 'Marvel Agents of Shield')
    fill_in('Network', :with => 'ABC')
    fill_in('Starting Year', :with => '2014')
    select('Drama', :from => 'Genre')
    fill_in('Synopsis', :with => 'Shield Agents protect the world from evil')
    #user submits
    click_button('Add TV Show')
    #expect new show to be in database
    expect(page).to have_content("Marvel Agents of Shield (ABC)")
  end

  scenario "fail to add a show with invalid information" do
    #get intial database count of TV shows
    initial_count = TelevisionShow.count
    #user visits homepage
    visit "/television_shows"
    #user navigates to add new show page
    click_link('Add New Show')
    #user fills forms but forgets to put in a title....a big No No.
    fill_in('Network', :with => 'ABC')
    fill_in('Starting Year', :with => '2014')
    select('Drama', :from => 'Genre')
    fill_in('Synopsis', :with => 'Shield Agents protect the world from evil')
    #user submits
    click_button('Add TV Show')
    expect(page).to have_content('Add Show')
    expect(initial_count).to be == TelevisionShow.count
  end

end
