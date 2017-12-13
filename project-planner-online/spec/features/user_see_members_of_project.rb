
feature 'user can see members of a project' do

# As a user
# I want to see the members of each project
# So I know who is working on the project
# Acceptance Criteria:
#
# On a project's show page, I should see the first name, last name, and email (if any) of each user who is working on the project.

before :each do
  require_relative './db/seeds.rb'
end


  it 'users views a project show page and can see members' do
    visit '/show/1'
    project = Project.first

    project.users.each do |user|
      expect(page).to have_content(user.name)
    end
  end

end
