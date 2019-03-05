require "rails_helper"

RSpec.feature "Visit single post from homepage", :type => :feature do
  let(:user) { create(:user) }
  let(:post) { create(:post) }

  scenario "User opens post modal", js: true do
    post
    visit root_path
    page.find(".single-post-card").click
    expect(page).to have_content('Posted by')
  end

  scenario "User opens post modal", js: true do
    post
    visit root_path
    page.find(".single-post-card").click
    expect(page).to have_content("I'm interested")
  end

  scenario "User opens post modal", js: true do
    post
    visit root_path
    page.find(".single-post-card").click
    expect(page).to have_content(post.title)
  end

  scenario "User opens post modal", js: true do
    post
    visit root_path
    page.find(".single-post-card").click
    expect(page).to have_content(post.user.name)
  end

end
