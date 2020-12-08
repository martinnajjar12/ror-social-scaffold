require 'rails_helper'

RSpec.describe 'Like', type: :request do
  before :each do
    User.create(name: 'John', email: 'john@example.com', password: 'password')
  end
  scenario 'create a comment' do
    visit new_user_session_path
    fill_in 'Email', with: 'John@example.com'
    fill_in 'Password', with: 'password'
    click_on 'Log in'
    visit root_path
    fill_in 'Add New Post', with: 'Hello'
    click_on 'Save'
    click_on 'Like'
    expect(page).to have_content('You liked a post.')
  end

  scenario 'create a comment' do
    visit new_user_session_path
    fill_in 'Email', with: 'John@example.com'
    fill_in 'Password', with: 'password'
    click_on 'Log in'
    visit root_path
    fill_in 'Add New Post', with: 'Hello'
    click_on 'Save'
    click_on 'Like'
    click_on 'Dislike'
    expect(page).to have_content('You disliked a post.')
  end
end
