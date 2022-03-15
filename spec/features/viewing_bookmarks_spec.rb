feature "Viewing bookmarks" do
  scenario "visit the home page" do
    visit("/")
    expect(page).to have_content "Bookmarks"
  end

  scenario "go to bookmark page and see bookmarks" do
    adding_three_urls_to_test_database
    visit("/")
    click_button "List of bookmarks"
    expect(page).to have_content "Makers"
    expect(page).to have_content "DAS"
    expect(page).to have_content "Google"
  end

end