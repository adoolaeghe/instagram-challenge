require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  let!(:user) { create(:user) }

  before do
    login(user)
    visit "/posts"
  end

  scenario "Can submit posts and view them" do
    fill_in "post_message", with: "Hello, world!"
    click_button "Submit"
    expect(page).to have_content("Hello, world!")
  end
end
