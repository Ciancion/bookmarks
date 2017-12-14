feature "log-in" do
  scenario "user logs in" do
  	visit '/'
  	fill_in("email", with: "me@here.co.uk")
  	fill_in("password", with: "ThisIsASuperSecurePassword.net")
  	click_button("Submit")

  	expect(page).to have_content("Here is the list of your bookmarks")
  	expect(page).to have_content("Hello me@here.co.uk")
  	expect(User.count).to eq 1
  end
end