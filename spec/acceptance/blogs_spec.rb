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

  context "create a new blog" do
    let(:new_blog_content) { "new example content" }

    before(:each) do
      page.should have_link("New Blog")
      click_on "New Blog"
    end

    scenario "launching blog new page and fill in content" do
      current_path.should == new_blog_path
      fill_in 'blog[content]', :with => new_blog_content
      click_on "Post"
      page.should have_content(new_blog_content)
    end
  end

  context "view list of blogs" do
    let(:content_1) { "alpha example blog content" }
    let(:content_2) { "beta example blog content" }

    before(:each) do
      Blog.create(content: content_1)
      Blog.create(content: content_2)
      visit current_path
    end

    scenario "launching the blogs index page" do
      blog_content = "example blog content"
      Blog.create(content: blog_content)
      visit current_path
      page.should have_content(blog_content)
    end
  end

  context "inspect a blog" do
    let(:blog_content) { "alpha example blog content" }
    let(:blog) { Blog.create(content: blog_content) }

    before(:each) do
      blog
      visit current_path
      click_on blog_content
    end

    scenario "launching blog show page" do
      current_path.should == blog_path(blog)
      page.should have_content(blog_content)
    end
  end

  context "edit a blog" do
    let(:blog_content) { "alpha example blog content" }
    let(:new_blog_content) { "beta example blog content" }
    let(:blog) { Blog.create(content: blog_content) }

    before(:each) do
      blog
      visit current_path
      click_on blog_content
      click_on "Edit"
    end

    scenario "launching edit blog page and edit content" do
      current_path.should == edit_blog_path(blog)
      fill_in 'blog[content]', :with => new_blog_content
      click_on "Post"
      page.should have_no_content(blog_content)
      page.should have_content(new_blog_content)
    end
  end

  context "remove a blog" do
    let(:blog_content) { "alpha example blog content" }
    let(:blog) { Blog.create(content: blog_content) }

    before(:each) do
      blog
      visit current_path
      click_on blog_content
      click_on "Remove"
    end

    scenario "after blog is removed" do
      current_path.should == blogs_path
      page.should have_no_content(blog_content)
    end
  end
end
