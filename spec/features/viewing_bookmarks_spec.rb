feature "Viewing bookmarks" do
  scenario "visit the home page" do
    visit("/")
    expect(page).to have_content "Bookmarks"
  end

  scenario "go to bookmark page and see bookmarks" do
    visit("/")
    click_button "List of bookmarks"
    expect(page).to have_content "http://www.makersacademy.com/"
    expect(page).to have_content "http://www.destroyallsoftware.com"
    expect(page).to have_content "http://www.google.com/"
  end

end