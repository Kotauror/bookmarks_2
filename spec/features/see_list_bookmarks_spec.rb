feature 'viewing bookmarks' do
  scenario 'user can view all bookmarks' do
    visit '/'
    expect(page).to have_content(["http://www.makersacademy.com", "http://www.google.com", "http://www.facebook.com", "http://www.twitter.com", "https://myspace.com"])
  end
end
