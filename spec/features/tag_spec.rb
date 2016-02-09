feature 'Tag adding' do
  scenario 'tagging links in bookmark manager' do
    visit '/links/new'
    fill_in 'title', with: 'NHL'
    fill_in 'url', with: 'http://www.nhl.com'
    fill_in 'tags', with: 'sports'
    click_button 'Submit'
    within 'ul#links' do
      expect(page).to have_content('NHL')
      expect(page).to have_content('sports')
    end
  end
end
