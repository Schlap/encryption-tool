feature 'User sees result' do

  before(:each){ visit '/'}

  scenario 'when entering text' do

    fill_in 'message', :with => 'hello'
    click_button 'encrypt'
    expect(page).to have_content ''
  end

end
