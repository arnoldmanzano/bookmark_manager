feature 'signing in' do
  scenario 'user wants to sign in' do
    User.create(name: 'Eirik Wiig', email: 'test_email@gmail.com', password: 'weak', password_confirmation: 'weak')
    visit('/log_in')
    fill_in('name', with: 'Eirik Wiig')
    fill_in('password', with: 'weak')
    click_button('Submit')
    expect(page).to have_content 'Welcome Eirik Wiig'
    expect(current_path).to eq '/signed_in'
  end

  scenario 'user signs in with wrong password' do
    User.create(name: 'Eirik Wiig', email: 'test_email@gmail.com', password: 'weak', password_confirmation: 'weak')
    visit('/log_in')
    fill_in('name', with: 'Eirik Wiig')
    fill_in('password', with: 'wrong')
    click_button('Submit')
    expect(page).to have_content 'Please sign in to bookmark manager'
    expect(page).to have_content 'Invalid password'
  end

  scenario 'user does not exist' do
    visit('/log_in')
    fill_in('name', with: 'Eirik Wiig')
    fill_in('password', with: 'wrong')
    click_button('Submit')
    expect(page).to have_content 'User does not exist'
  end
end
