require 'spec_helper'

feature "blogs page", %q{
  In other to express ideas
  As a user
  I want to be able to create and manage blogs
} do

  let(:user_email) { "test@example.com" }

  background do
    visit root_path
    click_on 'blogs'
  end

  context "create a new blog" do
    let(:new_blog_content) { "new example content" }
    let(:new_blog_title) { "new example title" }

    before(:each) do
      page.should have_link("new blog")
      click_on "new blog"
    end

    scenario "launching blog new page and fill in content" do
      current_path.should == new_blog_path
      fill_in 'blog[content]', :with => new_blog_content
      fill_in 'blog[title]', :with => new_blog_title
      fill_in 'blog[email]', :with => user_email
      click_on "Post"
      current_path.should == blog_path(Blog.last)
      page.should have_content(new_blog_content)
      page.should have_content(new_blog_title)
      page.should have_content(user_email)
    end
  end

  context "view list of blogs" do
    let(:title_1) { "alpha example blog title" }
    let(:title_2) { "beta example blog title" }
    let(:content_1) { "alpha example blog content" }
    let(:content_2) { "beta example blog content" }

    before(:each) do
      Blog.create(content: content_1, title: title_1, email: user_email)
      Blog.create(content: content_2, title: title_2, email: user_email)
      visit current_path
    end

    scenario "launching the blogs index page" do
      page.should have_no_content(content_1)
      page.should have_no_content(content_2)
      page.should have_content(title_1)
      page.should have_content(title_2)
      page.should have_content(user_email)
    end
  end

  context "inspect a blog" do
    let(:blog_content) { "alpha example blog content" }
    let(:blog_title) { "alpha example blog title" }
    let(:blog) { Blog.create(content: blog_content, title: blog_title, email: user_email) }

    before(:each) do
      blog
      visit current_path
      click_on blog_title
    end

    scenario "launching blog show page" do
      current_path.should == blog_path(blog)
      page.should have_content(blog_title)
      page.should have_content(blog_content)
    end
  end

  context "edit a blog" do
    let(:blog_content) { "alpha example blog content" }
    let(:blog_title) { "alpha example blog title" }
    let(:new_blog_content) { "beta example blog content" }
    let(:blog) { Blog.create(content: blog_content, title: blog_title, email: user_email) }

    before(:each) do
      blog
      visit current_path
      click_on blog_title
      click_on "Edit"
    end

    scenario "launching edit blog page and edit content" do
      current_path.should == edit_blog_path(blog)
      fill_in 'blog[content]', :with => new_blog_content
      click_on "Post"
      current_path.should == blog_path(blog)
      page.should have_no_content(blog_content)
      page.should have_content(new_blog_content)
    end
  end

  context "remove a blog" do
    let(:blog_content) { "alpha example blog content" }
    let(:blog_title) { "alpha example blog title" }
    let(:blog) { Blog.create(content: blog_content, title: blog_title, email: user_email) }

    before(:each) do
      blog
      visit current_path
      click_on blog_title
      click_on "Remove"
    end

    scenario "after blog is removed" do
      current_path.should == blogs_path
      page.should have_no_content(blog_title)
    end
  end
end
