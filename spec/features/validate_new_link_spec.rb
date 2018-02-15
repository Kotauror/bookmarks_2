feature 'validate new links' do
  scenario 'the link must be a valid url' do
    visit('/bookmarks')
    click_button 'Add bookmark'
    fill_in 'url', with: 'TEST'
    click_button 'Submit'
    expect(page).to have_content "You have to submit a valid URL (start with www or http://)."
  end
end
