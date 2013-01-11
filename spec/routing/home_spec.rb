require 'spec_helper'

describe "routing to home page" do
  it "routes root to home#index" do
    { :get => "/" }.
      should route_to(
        :controller => "home",
        :action => "index"
      )
  end
end
