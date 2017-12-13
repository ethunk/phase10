require 'spec_helper'
require 'faker'




feature 'user can view a list of attendees' do
# As a user
# I want to view a list of all projects
# So I know what projects are ongoing

# Acceptance Criteria:
#
# On the projects index page, I should see the name of each project.
# On the projects index page, the name of each project should be a link to the project's show page.

  before :each do
    binding.pry
    require_relative './'
  end

  it 'should show the name of each project on the index page, and link to the show page' do
    visit '/index'
    expect(page).to have_content(Project.where('id = ?', 1)[0].name)
    expect(page).to have_content(Project.where('id = ?', 2)[0].name)
    expect(page).to have_content(Project.where('id = ?', 3)[0].name)
    [1,2,3].each do |index|
      expect(page).to have_link(Project.where("id = #{index}")[0].name, href: "/show/#{index}")
    end
  end

end
