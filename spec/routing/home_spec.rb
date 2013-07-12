require 'spec_helper'

describe "route to home page" do
  it "routes root to home#index" do
    { :get => "/" }.
      should route_to(
        :controller => "home",
        :action => "index")
  end
end

describe "route to project euler page" do
  it "routes root to home#p_euler" do
    { :get => "/project_euler" }.
      should route_to(
        :controller => "home",
        :action => "p_euler")
  end
end
