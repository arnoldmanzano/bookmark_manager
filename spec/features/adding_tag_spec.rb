feature 'Adding tags to links' do

  scenario '-> users can add tags to their links' do
    visit('/links/new')
    fill_in('title', with: 'BBC News')
    fill_in('url', with: 'www.bbc.co.uk')
    fill_in('tag', with: 'news')
    click_button('Submit')
    expect(page).to have_content 'Title: BBC News'
    expect(page).to have_content 'URL: www.bbc.co.uk'
    expect(page).to have_content 'Tag: news'
  end
end
