feature 'update links' do
  scenario 'user wants to update an existing link' do
    visit '/'
    click_button('update bookmark')
    fill_in('title', with: 'Google')
    click_button('Submit')
    fill_in('new_title', with: 'Search Engine')
    fill_in('new_url', with: 'http://www.google.com')
    click_button('Submit')
    expect(page).to have_content 'Search Engine'
  end
end
