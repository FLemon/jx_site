module ChefHelper
  def cook(food)
    CodeChef::RubyChef.new.cook(food)
  end
end
