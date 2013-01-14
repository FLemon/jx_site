require 'spec_helper'

feature "header", %q{
  In order to see other pages
  As a user
  I want to be able to navigate accross the site 
} do

  background do
    visit root_path
  end

  scenario "navigation list" do
    page.should have_link("Blogs")
  end
end
