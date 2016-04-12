feature 'Filtering Tags' do

  scenario '-> it filters links according to tag' do
    link = Link.create(url:'http://makersacademy.com', title:'Makers Academy')
    tag = Tag.create(name: 'education')
    link2 = Link.create(url:'http://bubblegame.org', title:'Bubble Game')
    tag2 = Tag.create(name: 'bubbles')
    link.tags << tag
    link.save
    link2.tags << tag2
    link2.save
    visit('/tags/bubbles')
    expect(page).to_not have_content('education')
    expect(page).to have_content('Title: Bubble Game')
    expect(page).to have_content('URL: http://bubblegame.org')
    expect(page).to have_content('Tag: bubbles')
  end
end
