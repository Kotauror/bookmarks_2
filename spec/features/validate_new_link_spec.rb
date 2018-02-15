feature 'validate new links' do
  scenario 'the link must be a valid url' do
    visit '/'
    click_button 'add bookmark'
    fill_in 'url', with: 'TEST'
    click_button 'submit'
    expect(page).to have_content "You must submit a valid URL"
  end
end