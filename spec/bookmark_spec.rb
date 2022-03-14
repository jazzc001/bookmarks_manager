describe Bookmark do
  it "can call all on itself and display an array of bookmarks" do
    bookmark = Bookmark.all
    expect(bookmark).to eq(["https://makers.tech/", "https://github.com/jazzc001"])
  end
end