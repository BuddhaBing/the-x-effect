def sign_up
  visit '/users/sign_up'
  fill_in :user_username, with: "test"
  fill_in :user_email, with: "test@testing.com"
  fill_in :user_password, with: "strongpassword"
  fill_in :user_password_confirmation, with: "strongpassword"
  click_button "Sign up"
end
def sign_out
  visit '/'
  click_link "Log out"
end
def sign_in
  visit '/users/sign_in'
  fill_in :user_email, with: "test@testing.com"
  fill_in :user_password, with: "strongpassword"
  click_button "Log in"
end
