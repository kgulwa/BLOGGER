require "application_system_test_case"

class UserAuthenticationsTest < ApplicationSystemTestCase
  test "user can sign up" do
    visit new_user_registration_path
    fill_in "Email", with: "test@example.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_on "Sign up"

    assert_text "WELCOME TO BLOGGER. YOU HAVE SIGNED UP SUCCESFULLY "
  end 
  test "user can log in" do
    User.create!(email: "login@example.com",password: "password")

    visit new_user_session_path
    fill_in "Email", with: "login@example.com"
    fill_in "Password", with "password"
    click_on "Log in"


    assert_text "SIGNED IN SUCCESSFULLY!!"
  end

  test "user can logout" do
    user = User.create!(email: "logout@example.com", password: "password")

    visit new_user_session_path
    fill_in "Email", with: user.email
    fill_in "Password", with: "password"
    click_on "Log in"

    click_on "Logout"

    assert_text "SIGNED OUT SUCCESSFULLY"
  end
end