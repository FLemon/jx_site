require 'spec_helper'

feature "home page", %q{
  In order to see my site
  As a browser
  I want to be able to lauch the home page
} do

  background do
    visit root_path
  end

  scenario "go to home page" do
    page.should have_content("Hello World")
  end

  context "project eluer" do
    scenario "go to project eluer page" do
      within ".navbar" do
        click_link "project euler"
      end

      page.should have_content("def multiples_of_3_and_5(below_x=1000)")
    end
  end
end
