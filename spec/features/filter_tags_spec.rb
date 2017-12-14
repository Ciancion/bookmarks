require_relative '../../app/models/tag.rb'
require_relative '../../app/models/link.rb'

feature 'Check that only links tagged are present' do
  scenario 'Show links with the same tag' do
    visit ('/links/new')
    fill_in "link_name", with: "Google"
    fill_in "link_url", with: "http://www.google.com"
    fill_in 'link_tag', with: 'testing'
    click_button "Submit"
    visit('links/new')

    fill_in "link_name", with: "Makers"
    fill_in "link_url", with: "http://www.makers.com"
    fill_in 'link_tag', with: 'bubbles'
    click_button "Submit"
    visit('tags/bubbles')

    expect(page).to_not have_content('www.google.com')
    expect(page).to have_content('www.makers.com')

  end
end
