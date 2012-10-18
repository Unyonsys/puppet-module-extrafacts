Puppet::Parser::Functions::newfunction(:ssha, :type => :rvalue, :doc => "Returns a SSHA hash value from a provided string.") do |args|
      require 'digest/sha1'
	  require 'base64'
	  
	  #Does not work for OpenLDAP passwords
      chars = ('a'..'z').to_a + ('0'..'9').to_a
      salt = Array.new(10, '').collect { chars[rand(chars.size)] }.join
      "{SSHA}"+Base64.encode64(Digest::SHA1.digest(args[0]+salt)+salt).chomp! 
end
