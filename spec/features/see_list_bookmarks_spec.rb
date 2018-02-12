feature 'viewing bookmarks' do
  scenario 'user can view all bookmarks' do
    visit '/'
    expect(page).to have_content(['Bookmark 1', 'Bookmark 2', 'Bookmark 3'])
  end
end
