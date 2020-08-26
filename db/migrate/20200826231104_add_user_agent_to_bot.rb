class AddUserAgentToBot < ActiveRecord::Migration[6.0]
  def change
    add_column :bots, :user_agent, :string
  end
end
