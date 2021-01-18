class AddCryptoToSub < ActiveRecord::Migration[6.0]
  def change
    add_column :subs, :crypto, :boolean
  end
end
