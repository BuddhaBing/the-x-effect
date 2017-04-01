feature 'Sign up' do
  it 'user can sign up for an account' do
    expect{sign_up}.to change{User.count}.by(1)
  end
end
feature 'Sign out' do
  it 'user can sign out of their account' do
    sign_up
    sign_out
    expect(page).to have_content "Signed out successfully."
  end
end
feature 'Sign in' do
  it 'user can sign out of their account' do
    sign_up
    sign_out
    sign_in
    expect(page).to have_content "Signed in successfully."
  end
end
