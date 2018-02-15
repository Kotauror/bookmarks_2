feature 'viewing bookmarks' do
  scenario 'user can view all bookmarks' do
    visit '/'
    expect(page).to have_content("Makers Academy", "Google", "Facebook")
  end
end
