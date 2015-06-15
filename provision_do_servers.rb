require_relative 'provisioner_do'

droplet_names = ARGV

pro = Provisioner::DO.new
droplet_names.each do |name|
  droplet = pro.provision_server(name)
  puts "Provisioned #{name}: #{droplet.inspect}"
end
