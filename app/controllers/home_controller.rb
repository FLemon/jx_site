class HomeController < ApplicationController
  def index
  end

  def p_euler
    @problem_sources = {}
    PEuler.instance_methods(false).each do |problem|
      @problem_sources[PEuler.instance_method(problem).source] = PEuler.new.send(problem)
    end
  end
end
