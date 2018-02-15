feature 'viewing bookmarks' do
  scenario 'user can view all bookmarks' do
    visit '/'
    click_button('display bookmarks')
    expect(page).to have_content("http://www.makersacademy.com", "http://www.google.com", "http://www.facebook.com")
  end
end
