feature 'viewing bookmarks' do
  scenario 'user can view all bookmarks' do
    visit('/bookmarks')
    expect(page).to have_content("Makers Academy")
  end
end
