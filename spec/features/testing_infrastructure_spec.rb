feature 'infrastructure' do
  scenario 'Accessing the website' do
    visit('/bookmarks')
    expect(page).to have_content 
  end
end
