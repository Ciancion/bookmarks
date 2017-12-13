require_relative "../../app/app.rb"

feature "User can create a new bookmark"  do

  scenario "Submission form has a submit button" do
    visit('links/new')
    expect(page).to have_button('Submit')
  end

  scenario "User fills the form and submits" do
    visit("links/new")
    fill_in "link_name", with: "Google"
    fill_in "link_url", with: "http://www.google.com"
    click_button "Submit"

    expect(current_path).to eq "/links"

    within 'ul#links' do
      expect(page).to have_content('Google')
    end
  end
end
