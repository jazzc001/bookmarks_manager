feature "Click title" do
    scenario "link to url" do
        adding_three_urls_to_test_database
        visit('/')
        click_button "List of bookmarks"
        expect(page).to have_link("Makers", href:"http://www.makersacademy.com/")
    end
end