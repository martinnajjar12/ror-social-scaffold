require 'rails_helper'

RSpec.describe 'Post', type: :request do
  before :each do
    User.create(name: 'John', email: 'john@example.com', password: 'password')
  end
  scenario 'create post' do
    visit new_user_session_path
    fill_in 'Email', with: 'John@example.com'
    fill_in 'Password', with: 'password'
    click_on 'Log in'
    visit root_path
    fill_in 'Add New Post', with: 'Hello'
    click_on 'Save'
    expect(page).to have_content('Post was successfully created.')
  end
end
