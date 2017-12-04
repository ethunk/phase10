require "spec_helper"
require 'pry'

feature "user views list of TV shows" do
  # As a TV fanatic
  # I want to edit an existing show
  # So that I can correct any foolish mistakes
  #
  # Acceptance Criteria:
  # * Editing a show provides a pre-populated form for each field.
  # * Submitting the edit form will update a show if all validations pass.
  # * The user is redirected to the details page for that show if successfully updated.
  # * If the update fails any validations, re-display the form with the appropriate error messages.
  scenario 'user changes the title of a TV Show successfully' do
    #Create TV Show Data
    game_of_thrones = TelevisionShow.create!({
        title: "Game of Thrones", network: "HBO",
        starting_year: 2011, genre: "Fantasy"
      })
    #user visits page
    visit "/television_shows"
    #clicks on show to display details
    click_link('Game of Thrones (HBO)')
    #clicks on edit
    click_link('Edit Show Details')
    #redirects to a new page that's specific for editing
    current_path.include?('edit/').should == true
    #forms are prepopulated with existing information
    expect(find_field('title').value).to eq 'Game of Thrones'
    expect(find_field('network').value).to eq 'HBO'
    expect(find_field('starting_year').value).to eq '2011'
    expect(find_field('genre').value).to eq 'Fantasy'
    #user changes title to something different
    fill_in 'title', :with => 'A Song of Ice and Wind'
    #clicks save
    click_button('Submit', :wait 2)
    #redirected to info page
    current_path.include?('television_shows/').should == true
    #change persists and information is updated.
    expect(find_field('title').value).to eq 'A Song of Ice and Wind'
  end

  xscenario 'User unsuccessfully attempts to change a title of a show and leave it blank' do
    #Create TV Show Data
    game_of_thrones = TelevisionShow.create!({
        title: "Game of Thrones", network: "HBO",
        starting_year: 2011, genre: "Fantasy"
      })
    #user visits page
    visit "/television_shows"
    #clicks on show to display details
    #clicks on edit
    #forms are prepopulated with existing information
    #user changes title to be blank
    #clicks save
    #redirected to edit page, but with error meesage displayed
  end

end
