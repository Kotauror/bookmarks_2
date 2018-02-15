feature 'viewing bookmarks' do
  scenario 'user can view all bookmarks' do
    visit '/'
    click_button('display bookmarks')
    expect(page).to have_content("Makers Academy", "Google", "Facebook")
  end
end
