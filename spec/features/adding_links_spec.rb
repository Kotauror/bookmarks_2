
feature "adding links" do 
  scenario "user adds a link" do 
    weird_website = "http://www.hannahhannahhannah.com"
    visit('/')
    click_button "add bookmark"
    fill_in "url", with: weird_website 
    click_button "submit"
    expect(page).to have_content weird_website
  end
end