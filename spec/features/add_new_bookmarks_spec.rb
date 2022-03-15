feature "Add new bookmarks" do
    scenario "able to submit" do
        visit("/")
        click_button "Add Bookmark"
        expect(page).to have_button "Submit"
    end

    scenario "have form" do
        visit("/")
        click_button("Add Bookmark")
        fill_in(:url_to_add, with: 'http://youtube.com')
        click_button "Submit"
        expect(page).to have_content('http://youtube.com')
    end
end
