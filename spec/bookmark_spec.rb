describe Bookmark do

  it "can call all on itself and display an array of bookmarks" do
    adding_three_urls_to_test_database

    bookmark = Bookmark.all

    expect(bookmark).to include("http://www.google.com/", "http://www.makersacademy.com/", "http://www.destroyallsoftware.com/")
  end

  it "has empty array" do
    bookmark = Bookmark.all

    expect(bookmark).to match_array([])
  end
  
end