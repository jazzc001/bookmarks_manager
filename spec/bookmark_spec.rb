require_relative './database_helper'
describe Bookmark do

  it 'should initialize with id, title, url' do
    bookmark = Bookmark.new(id: 12, title: 'Apple', url: 'www.apple.com')
    expect { bookmark }.to_not raise_error
  end

  it 'has id, title, url' do
    bookmark = Bookmark.new(id: 12, title: 'Apple', url: 'www.apple.com')
    expect(bookmark.id).to eq 12
    expect(bookmark.title).to eq 'Apple'
    expect(bookmark.url).to eq 'www.apple.com'
  end

  describe '.all' do

    it "can call all on itself and display an array of bookmarks" do
      adding_three_urls_to_test_database

      bookmark = Bookmark.all

      expect(bookmark.first.title).to eq("Google")
      expect(bookmark[1].title).to eq("Makers")
      expect(bookmark.last.title).to eq("DAS")
    end

    it "has empty array" do
      bookmark = Bookmark.all

      expect(bookmark).to match_array([])
    end

    it "initialises a bookmark object with id, title and url" do
      bookmark = Bookmark.create(url: 'www.youtube.com', title: "YouTube")
      persisted_data = persisted_data(id: bookmark.id)
      
      expect(bookmark).to be_a Bookmark
      expect(bookmark.id).to eq persisted_data['id']
      expect(bookmark).to have_attributes(title: "YouTube", url: 'www.youtube.com') 
    
    end

  end

  describe '.create' do
    it 'add new urls' do
        bookmark = Bookmark.create(url: "www.youtube.com", title: "YouTube")
        persisted_data = persisted_data(id: bookmark.id)

        expect(bookmark.title).to eq("YouTube")
        expect(bookmark.id).to eq persisted_data['id']
    end
  end

  describe '.delete' do
    it 'delete google in the sample' do
      bookmark1 = Bookmark.create(url: 'http://www.google.com/', title: 'Google')
      bookmark2 = Bookmark.create(url: 'http://www.makersacademy.com/', title: "Makers")
      bookmark3 = Bookmark.create(url: 'http://www.destroyallsoftware.com/', title: "DAS")
      Bookmark.delete(id: bookmark1.id)
      
      bookmarks = Bookmark.all

      expect(bookmarks.length).to eq 2
      expect(bookmarks.first.id).to eq bookmark2.id
      expect(bookmarks.first.title).to eq 'Makers'
    end
  end
  
  

end