feature 'Creating new link' do
  scenario 'adding site url to bookmark manager'  do
    visit '/links/new'
    fill_in 'title', with: 'Yahoo'
    fill_in 'url', with: 'http://www.yahoo.com'
    click_button 'Submit'
    within 'ul#links' do
      expect(page).to have_content('Yahoo')
    end
  end
end
