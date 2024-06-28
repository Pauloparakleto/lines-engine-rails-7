require 'spec_helper'

describe 'user logs in' do
  xit 'with valid email and password' do
    log_in({ email: 'valid@example.com', password: 'password' })

    expect(page).to have_content('Logged in')
  end

  xit 'with invalid email' do
    @_current_lines_user = FactoryBot.create(:user)
    visit lines.login_path
    fill_in "email", with: "invalid_email"
    fill_in "password", with: 'sekret1234'
    click_button "Login"
    page.should have_content('Email or password is invalid')
  end

  xit 'with blank password' do
    @_current_lines_user = FactoryBot.create(:user, email: 'valid@example.com')
    visit lines.login_path
    fill_in "email", with: "valid@example.com"
    fill_in "password", with: ''
    click_button "Login"
    page.should have_content('Email or password is invalid')
  end 
end
