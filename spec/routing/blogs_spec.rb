require 'spec_helper'

describe "routing to blogs page" do
  it "routes root to blogs#index" do
    { :get => "/blogs" }.
      should route_to(
        :controller => "blogs",
        :action => "index"
      )
  end
end
