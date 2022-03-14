feature "Viewing bookmarks" do
  scenario "visit the home page" do
    visit("/")
    expect(page).to have_content "Bookmarks"
  end

  scenario "go to bookmark page and see bookmarks" do
    visit("/")
    click_button "List of bookmarks"
    expect(page).to have_content "https://makers.tech/"
    expect(page).to have_content "https://github.com/jazzc001"
  end

end