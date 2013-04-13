require 'spec_helper'

feature 'layout', %q{
  layout feature
} do

  background do
    visit root_path
  end

  context "header navigation" do
    scenario "navigate to blogs" do
      page.should have_link('blogs')
      click_on 'blogs'
      current_path.should == blogs_path
    end

    scenario "navigate to home" do
      page.should have_link('home')
      click_on 'home'
      current_path.should == root_path
    end

    scenario "navigate to project euler" do
      page.should have_link('project euler')
      click_on 'project euler'
      current_path.should == p_euler_home_path
    end
  end
end
