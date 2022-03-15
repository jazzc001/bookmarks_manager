def adding_three_urls_to_test_database
    Bookmark.create(url: 'http://www.google.com/', title: 'Google')
    Bookmark.create(url: 'http://www.makersacademy.com/', title: "Makers")
    Bookmark.create(url: 'http://www.destroyallsoftware.com/', title: "DAS")
end