feature "Update bookmark" do
    scenario "A user can update a bookmark" do
        bookmark = Bookmark.create(title: 'Jasmine', url: 'www.jasmine.com')
        visit("/")
        click_button "List of bookmarks"
        expect(current_path).to eq '/bookmarks'
        expect(page).to have_link('Jasmine', href: 'www.jasmine.com')

        first('.bookmark').click_button 'Edit'
        expect(current_path).to eq "/bookmarks/#{bookmark.id}/update"

        fill_in('url_to_change', with: "www.jasminecheung.com")
        fill_in('title_to_change', with: "JasmineC")
        click_button "Submit"

        expect(current_path).to eq '/bookmarks'
        expect(page).not_to have_link('Jasmine', href: 'www.jasmine.com')
        expect(page).to have_link('Jasmine', href: 'www.jasminecheung.com')
    end
end