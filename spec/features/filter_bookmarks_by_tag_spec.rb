feature 'filter bookmarks by tags' do

  scenario 'user filters a content by tags' do
    visit('/bookmarks')
    click_button('Bookmarks by Tags')
    fill_in('tag', with: 'social')
    click_button('Submit')
    expect(page).to have_content('Facebook')
  end

  # scenario 'user tries to delete a link thet not in the database' do
  #   visit('/bookmarks')
  #   click_button('Delete bookmark')
  #   fill_in('title', with: 'Cats')
  #   click_button('Submit')
  #   expect(page).to have_content "This title doesn't exist in the database."
  # end

end
