require 'spec_helper'

feature "home page", %q{
  In order to see my site
  As a browser
  I want to be able to lauch the home page
} do

  background do
    visit root_path
  end

  scenario "lanching the home page" do
    page.should have_content("Hello World")
  end
end
