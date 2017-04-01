feature 'Sign up' do
  it 'user can sign up for an account' do
    expect{sign_up}.to change{User.count}.by(1)
  end
end
