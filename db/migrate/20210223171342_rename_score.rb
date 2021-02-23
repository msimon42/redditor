class RenameScore < ActiveRecord::Migration[6.0]
  def change
    rename_column :bots, :score, :comment_karma
  end
end
