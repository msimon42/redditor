class AddTokensToBots < ActiveRecord::Migration[6.0]
  def change
    add_column :bots, :client_id, :string
    add_column :bots, :client_secret, :string
  end
end
