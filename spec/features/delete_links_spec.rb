feature 'delete links' do

  scenario 'user deletes a link' do
    visit('/bookmarks')
    click_button('Delete bookmark')
    fill_in('title', with: 'Google')
    fill_in('id', with: '2')
    click_button('Submit')
    expect(page).not_to have_content('Google')
  end

  scenario 'user tries to delete a link thet not in the database' do
    visit('/bookmarks')
    click_button('Delete bookmark')
    fill_in('title', with: 'Cats')
    click_button('Submit')
    expect(page).to have_content "This title doesn't exist in the database."
  end

end
