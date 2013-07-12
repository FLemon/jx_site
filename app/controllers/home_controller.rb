class HomeController < ApplicationController
  def index
  end

  def p_euler
    PEuler.methods(false).each do |problem|
      @problem_sources ||= [] << [
        cook(PEuler.method(problem)),
        PEuler.send(problem)]
    end
  end
end
