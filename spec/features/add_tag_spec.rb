require_relative '../../app/models/tag.rb'
require_relative '../../app/models/link.rb'

feature 'User can tag links' do

 scenario 'Add links page should have tag field' do
    visit('/links/new')

   expect(page).to have_field('link_tag')
  end

 scenario 'Tags should be added to the links' do
    visit('/links/new')
    fill_in "link_name", with: "Google"
    fill_in "link_url", with: "http://www.google.com"
    fill_in 'link_tag', with: 'testing'
    click_button "Submit"

   expect(page).to have_content 'testing'
  end
end
