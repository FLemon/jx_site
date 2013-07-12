module CodeChef
  class RubyChef
    def cook(method)
      path_line = method.source_location
      path = path_line[0]
      line = path_line[1]
      plate = ""

      File.open(path) do |f|
        tracker = 1
        (line-1).times{ f.gets }
        while tracker != 0
          line = f.gets
          plate << line
          tracker += 1 if line =~ /^while/ || line =~ /^if/ || line =~ / do /
          tracker -= 1 if line =~ /end/
        end
      end
      plate
    end
  end
end
