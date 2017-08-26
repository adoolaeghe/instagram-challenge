
require 'rails_helper'

RSpec.feature "User", type: :feature do
  let!(:user) { create(:user) }

  scenario "I can sign up" do
    sign_up
    expect(page).to have_content('Welcome! You have signed up successfully.')
  end

  context "/sign_in" do
  scenario "After signing out, I'm forward" do
    sign_up
    p page.body
    click_link 'Logout'
    expect(current_path).to eq "/"
  end
  end
end
