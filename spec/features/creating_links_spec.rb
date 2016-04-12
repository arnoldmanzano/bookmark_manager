feature 'Creating Links' do

  scenario '-> users can create links and save them' do
    visit('/links/new')
    fill_in('title', with: 'Google')
    fill_in('url', with: 'www.google.com')
    click_button('Submit')
    expect(page).to have_content 'Title: Google'
    expect(page).to have_content 'URL: www.google.com'
  end
end
