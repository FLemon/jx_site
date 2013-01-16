require 'spec_helper'

feature "header", %q{
  In order to see other pages
  As a user
  I want to be able to navigate accross the site
} do

  background do
    visit root_path
  end

  scenario "display site version" do
    page.should have_content("v0.1")
  end

  scenario "navigate to blogs" do
    page.should have_link("Blogs")
    click_on 'Blogs'
    current_path.should == blogs_path
  end

  scenario "navigate to home" do
    page.should have_link("Home")
    click_on 'Home'
    current_path.should == root_path
  end
end
