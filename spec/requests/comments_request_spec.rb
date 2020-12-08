require 'rails_helper'

RSpec.describe 'Comment', type: :request do
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
    fill_in 'Add new Comment', with: 'I am a comment'
    click_on 'Comment'
    expect(page).to have_content('Comment was successfully created.')
  end
end
