class HomeController < ApplicationController
  def index
  end

  def p_euler
    @problem_sources = []
    PEuler.methods(false).each do |problem|
      a = ""
      source_location_and_line = PEuler.method(problem).source_location

      File.open(source_location_and_line[0]) do |f|
        stack = 1
        (source_location_and_line[1]-1).times{ f.gets }
        while stack != 0
          line = f.gets
          a << line
          stack += 1 if line =~ /^while/ || line =~ /^if/ || line =~ / do /
          stack -= 1 if line =~ /end/
        end
      end

      @problem_sources << [a, PEuler.send(problem)]
    end
  end
end
