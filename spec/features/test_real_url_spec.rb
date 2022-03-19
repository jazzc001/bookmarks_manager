feature "Test URL" do
    scenario "enter wrong url" do
        visit("/")
        click_button "Add Bookmark"
        fill_in(:url_to_add, with: 'httpyoutube.com')
        fill_in(:url_title, with: 'YouTube')
        click_button "Submit"
        expect(page).to have_content('You must submit a valid URL.')
    end
end