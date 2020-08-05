class AddScore < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :score, :integer
    add_column :comments, :score, :integer
  end
end
