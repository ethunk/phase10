require 'spec_helper'
require 'orderly'
require 'rails-helper'
require 'faker'

feature 'user views details of a meetup' do
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

  it 'user cannot see link for new without being signed in' do
    visit '/'
    expect(page).to have_no_content('Add New')
  end


  it 'if user visits new page without being signed in no form will be displayed' do
    visit '/new'
    expect(page).to have_content('You must be signed in to add a new meetup')
    expect(page).to have_no_content('Name:')
  end


  scenario 'user sucesfully adds new meetup' do
    visit '/'
    sign_in_as user
    visit '/new'
    fill_in('name', :with => 'New Years Party with Superman and Company')
    fill_in('location', :with => 'Watch Tower (Fortress of Solitude Entrance)')
    page.find('#date').set("2017-12-31")
    fill_in('start_time', :with => '08:00 PM')
    fill_in('end_time', :with => '12:00 AM')
    fill_in('description', :with => 'Celebrate the end of the world with Super Heros')

    click_on('Submit')
    #is redirected to homepage and can see the new meetup is added.

    expect(page.current_path).to include("#{Meetup.last.id}")
    #A message is shown at the top that a new show was added successfully.
    expect(page).to have_content("You've succesfully added #{Meetup.last.name}")
  end

  it 'user unsucessfuly adds new meetup' do
    visit '/'
    sign_in_as user
    visit '/new'
    fill_in('name', :with => 'New Years Party with Superman and Company')
    fill_in('location', :with => 'Watch Tower (Fortress of Solitude Entrance)')
    click_on('Submit')

    expect(page.current_path).to include('/new')
    expect(page).to have_content("description can't be blank")
  end

end
