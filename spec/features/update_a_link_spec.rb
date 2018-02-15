feature 'update links' do
  scenario 'user wants to update an existing link' do
    visit('/bookmarks')
    click_button('Update bookmark')
    fill_in('title', with: 'Google')
    click_button('Submit')
    fill_in('new_title', with: 'Search Engine')
    fill_in('new_url', with: 'http://www.google.com')
    click_button('Submit')
    expect(page).to have_content 'Search Engine'
  end

  scenario 'user wants to update a nonexisting link' do
    visit('/bookmarks')
    click_button('Update bookmark')
    fill_in('title', with: 'Cats')
    click_button('Submit')
    expect(page).to have_content "This title doesn't exist in the database."
  end

  scenario 'user provides an invalid url' do
    visit('/bookmarks')
    click_button('Update bookmark')
    fill_in('title', with: 'Google')
    click_button('Submit')
    fill_in('new_title', with: 'Search Engine')
    fill_in('new_url', with: 'google.com')
    click_button('Submit')
    expect(page).to have_content 'You have to submit a valid URL (start with www or http://).'
  end
end
