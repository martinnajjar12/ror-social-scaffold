RSpec.describe 'Users', type: :request do
  before :each do
    User.create(name: 'John', email: 'john@example.com', password: 'password')
  end
  scenario 'Signs in user' do
    visit new_user_session_path
    fill_in 'Email', with: 'John@example.com'
    fill_in 'Password', with: 'password'
    click_on 'Log in'
    expect(page).to have_content('Signed in successfully.')
  end

  scenario 'Invalid user inputs' do
    visit new_user_session_path
    fill_in 'Email', with: 'John@example.com'
    fill_in 'Password', with: 'passwords'
    click_on 'Log in'
    expect(page).to have_content('Invalid Email or password.')
  end

  scenario 'invalid inputs for user sign up' do
    visit new_user_registration_path
    fill_in 'Name', with: ''
    fill_in 'Email', with: 'jim@example.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_on 'Sign up'
    expect(page).to have_content('1 error prohibited this user from being saved:')
  end

  scenario 'valid inputs for user sign up' do
    visit new_user_registration_path
    fill_in 'Name', with: 'John'
    fill_in 'Email', with: 'hello@example.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_on 'Sign up'
    expect(page).to have_content('Welcome! You have signed up successfully.')
  end
end
