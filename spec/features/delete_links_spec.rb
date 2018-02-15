feature 'delete links' do
  scenario 'user deletes a link' do
    visit('/bookmarks')
    click_button('Delete bookmark')
    fill_in('title', with: 'Google')
    click_button('Submit')
    expect(page).not_to have_content('Google')
  end

  scenario 'user enters a title not in the database' do
    visit('/bookmarks')
    click_button('Delete bookmark')
    fill_in('title', with: 'Cats')
    click_button('Submit')
    expect(page).to have_content "This title is not a saved bookmark"
  end
end
