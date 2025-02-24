require 'spec_helper'

describe 'user resets password' do
  before(:each) do
    @user = FactoryBot.create(:user, password: 'password1234')
    visit lines.login_path
    expect(page).to have_content "Forgot password"
    click_on "Forgot password"
    expect(page).to have_content "Reset password"
    fill_in "password_reset_email", with: @user.email
    find('input[name="commit"]').click
    expect(page).to have_content "Reset instructions have been sent"
    #generate new reset token
    @user.create_reset_digest
    visit lines.edit_password_reset_url(@user.reload.reset_token, email: @user.email)
    expect(page).to have_content 'Set new password'
  end

  xit 'with valid password' do
    fill_in "user_password", with: 'testtest'
    fill_in "user_password_confirmation", with: 'testtest'
    find('input[name="commit"]').click
    expect(page).to have_content 'Password has been reset.'
    expect(@user.reload.reset_digest).to eq nil
  end

  xit 'with password too short' do
    fill_in "user_password", with: 't'
    fill_in "user_password_confirmation", with: 't'
    find('input[name="commit"]').click
    expect(page).to have_content 'too short'
  end

  xit 'with empty password' do
    fill_in "user_password", with: ''
    fill_in "user_password_confirmation", with: ''
    find('input[name="commit"]').click
    expect(page).to have_content "Password can't be blank"
  end

  xit 'with password confirmation not matching' do
    fill_in "user_password", with: 'testtest'
    fill_in "user_password_confirmation", with: 'testtest234'
    find('input[name="commit"]').click
    expect(page).to have_content 'not match'
  end
end
