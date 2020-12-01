class AddCryptoToSub < ActiveRecord::Migration[6.0]
  def change
    add_column :sub, :crypto, :boolean
  end
end
