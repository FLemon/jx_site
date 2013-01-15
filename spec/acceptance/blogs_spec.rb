require 'spec_helper'

feature "blogs page", %q{
  In other to express ideas
  As a user
  I want to be able to create and manage blogs
} do

  background do
    visit root_path
    click_on 'Blogs'
  end

  scenario "create a new blog" do
    page.should have_link("New Blog")
  end

  scenario "view all blogs" do
    blog_content = "example blog content"
    Blog.create(content: blog_content)
    page.should have_content(blog_content)
  end
end
