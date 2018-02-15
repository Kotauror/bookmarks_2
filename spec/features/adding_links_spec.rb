
feature "adding links" do
  scenario "user adds a link" do
    visit('/')
    click_button "Add bookmark"
    fill_in "url", with: "http://www.test.com"
    fill_in "title", with: 'TEST'
    click_button "Submit"
    expect(page).to have_content 'TEST'
  end
end
