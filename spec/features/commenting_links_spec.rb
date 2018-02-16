feature 'adding comments to links' do
  scenario 'user adds a comment to a link' do
    visit('/bookmarks')
    click_button('Comment Bookmark')
    fill_in('id', with: '1')
    fill_in('comment', with: 'coding bootcamp')
    click_button('Submit')
    expect(page).to have_content('bootcamp')
  end
end
