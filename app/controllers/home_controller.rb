class HomeController < ApplicationController
  def index
  end

  def p_euler
    PEuler.methods(false).each do |problem|
      @problem_sources ||= [] << [
        CodeChef::RubyChef.new.cook(PEuler.method(problem)),
        PEuler.send(problem)]
    end
  end
end
