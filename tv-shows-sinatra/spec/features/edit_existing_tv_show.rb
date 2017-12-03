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
    #clicks on edit
    #forms are prepopulated with existing information
    #user changes title to something different
    #clicks save
    #redirected to info page
    #change persists and information is updated.
  end

  scenario 'User unsuccessfully attempts to change a title of a show and leave it blank' do
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
