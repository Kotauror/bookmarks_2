feature 'adding tags to links' do
  scenario 'user adds a tag to a link' do
    visit('/bookmarks')
    click_button('Tag Bookmark')
    fill_in('link_id', with: '1')
    fill_in('tag', with: 'coding')
    click_button('Submit')
    expect(page).to have_content('coding')
  end
end
