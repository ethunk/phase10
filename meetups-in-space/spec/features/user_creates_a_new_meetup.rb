require 'spec_helper'
require 'orderly'
require 'rails-helper'
require 'faker'

feature 'user views details of a meetup' do

  before :each do
  end
  # As a user
  # I want to create a meetup
  # So that I can gather a group of people to do an activity
  # Acceptance Criteria:
  #
  # There should be a link from the meetups index page that takes you to the meetups new page. On this page there is a form to create a new meetup.
  # [x] I must be signed in, and I must supply a name, location, and description.
  # [x] If the form submission is successful, I should be brought to the meetup's show page, and I should see a message that lets me know that I have created a meetup successfully.
  # If the form submission is unsuccessful, I should remain on the meetups new page, and I should see error messages explaining why the form submission was unsuccessful. The form should be pre-filled with the values that were provided when the form was submitted.


  it 'user sucesfully adds new meetup' do
    visit '/new'
    #fill in content
    #click submit
    #is redirected to homepage and can see the new meetup is added.
    #A message is shown at the top that a new show was added successfully.
  end

  it 'user unsucessfuly adds new meetup' do

    #submits, but is redirected to same page with prepopulated fields and error messages displayed at the top
  end


end
