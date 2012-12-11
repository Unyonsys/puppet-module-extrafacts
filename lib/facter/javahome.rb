require 'pathname'
Facter.add('java_home') do
  confine :kernel => :linux
  setcode do
    if FileTest.exists?('/usr/bin/java')
        p = Pathname.new('/usr/bin/java')
        java_home = File.dirname(File.dirname(p.realpath()))
    end
  end
end
