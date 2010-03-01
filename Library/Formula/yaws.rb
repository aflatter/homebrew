require 'formula'

class Yaws < Formula
  homepage "http://yaws.hyber.org"

  version "1.87"
  md5     "ee04c67b1a3869eaef380153d24504c0"

  url "http://yaws.hyber.org/download/yaws-#{version}.tar.gz"

 depends_on 'erlang'
 
 def options
   [["--with-yapp", "Build and install yaws applications"]]
 end

  def install
    system "cd yaws && ./configure --prefix=#{prefix}"
    system "cd yaws && make install"
    
    if ARGV.include?('--with-yapp')
      system "cd yaws/applications/yapp && make && make install"
    end
  end
  
    def caveats; <<-EOS
  Usually you want to build yapp (yaws applications) as well. To do so, use the --with-yapp command line flag.
      EOS
    end
end
