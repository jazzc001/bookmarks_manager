describe Bookmark do
  it "can call all on itself and display an array of bookmarks" do
    bookmark = Bookmark.all
    expect(bookmark).to eq(["http://www.google.com/", "http://www.makersacademy.com/", "http://www.destroyallsoftware.com"])
  end
end