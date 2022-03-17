feature "Delete a bookmark" do
    scenario 'delete a link' do
        Bookmark.create(title: 'Jasmine', url: 'www.jasmine.com')
        visit('/bookmarks')
        expect(page).to have_button "Delete"

        first('.bookmark').click_button 'Delete'

        expect(current_path).to eq '/bookmarks'
        expect(page).not_to have_link("www.jasmine.com")
    end

    
end