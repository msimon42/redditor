class AddScoreToBots < ActiveRecord::Migration[6.0]
  def change
    add_column :bots, :score, :integer
    add_column :posts, :bot_post, :boolean
    add_column :comments, :bot_post, :boolean
  end
end
