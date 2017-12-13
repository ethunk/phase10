require 'spec_helper'
require 'faker'


# As a user
# I want to see the details of a project
# So I can learn more about each project
# Acceptance Criteria:
#
# On a project's show page, I should see the name and description (if any) of the project.

feature 'user views show page of a project and sees name and description of project' do


  it 'shows details of a project' do
    3.times do
      Project.create(
        name: Faker::SiliconValley.app,
        description: Faker::SiliconValley.motto
      )
    end
    visit '/'

    project = Project.first
    click_on("#{project.name}")
    expect(page).to have_content(project.description)
    expect(page).to have_content(project.name)
  end
end
