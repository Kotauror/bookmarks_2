feature "adding links" do

  scenario "user adds a link with valid url" do
    visit('/bookmarks')
    click_button "Add bookmark"
    fill_in "url", with: "http://www.test.com"
    fill_in "title", with: 'TEST'
    click_button "Submit"
    expect(page).to have_content 'TEST'
  end

  scenario 'user adds a link with invalid url' do
    visit('/bookmarks')
    click_button 'Add bookmark'
    fill_in 'url', with: 'TEST'
    click_button 'Submit'
    expect(page).to have_content "You have to submit a valid URL (start with http:// or https://)."
  end

end
