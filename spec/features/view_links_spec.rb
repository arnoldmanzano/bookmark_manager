require 'spec_helper'

feature 'Viewing Links' do

  scenario '-> users can view the list of links on the links page' do
    Link.create(url:'http://localhost:4567', title:'Bookmark Manager')
    visit '/links'
    expect(page.status_code).to eq 200
  end
end
