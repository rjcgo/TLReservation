require 'rubygems'
require 'net/ldap'

server_ip_address = 'ed-p-gl.emea.nsn-net.net'

ldap = Net::LDAP.new :host => server_ip_address,
:port => 389

filter = Net::LDAP::Filter.eq( "mail", "yves.francisco*" )
treebase = "o=nsn"

open('myfile.txt', 'w') { |f|
ldap.search( :base => treebase, :filter => filter ) do |entry|
  f.puts "DN: #{entry.dn}"
  entry.each do |attribute, values|
    f.puts "   #{attribute}:"
    values.each do |value|
      f.puts "      --->#{value}"
    end
  end
end
}

p ldap.get_operation_result

# require 'net/ldap'

# user,psw = "yves.francisco@nokia.com", "123ASDfgh"

# ldap = Net::LDAP.new
# ldap.host = "ed-p-gl.emea.nsn-net.net"
# ldap.port = 389
# # ldap.auth "cn=manager,dc=yourcompany,dc=com", "topsecret"

# result = ldap.bind_as(
#   :base => "o=nsn",
#   :filter => "(mail=#{user})",
#   :password => psw
# )
# if result
#   puts "Authenticated #{result.first.dn}"
# else
#   puts "Authentication FAILED."
# end