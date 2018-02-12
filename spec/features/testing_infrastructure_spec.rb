feature 'infrastructure' do
  scenario 'Accessing the website' do
    visit '/'
    expect(page).to have_content 
  end
end
