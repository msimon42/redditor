desc 'saves vpn server addresses in db'
task :collect_addresses => :environment do
  # puts File.expand_path(File.dirname(__FILE__))
  list = File.open(ENV['SERVER_LIST_PATH'])
  list.readlines.each do |server|
    endpos = server.index('tcp') + 2
    VpnServer.create(address: server[0..endpos])
  end
end
