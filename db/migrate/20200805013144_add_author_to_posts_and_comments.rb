class AddAuthorToPostsAndComments < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :author, :string
    add_column :comments, :author, :string
  end
end
