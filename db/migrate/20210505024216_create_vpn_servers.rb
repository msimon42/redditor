class CreateVpnServers < ActiveRecord::Migration[6.0]
  def change
    create_table :vpn_servers do |t|
      t.string :address

      t.timestamps
    end
  end
end
