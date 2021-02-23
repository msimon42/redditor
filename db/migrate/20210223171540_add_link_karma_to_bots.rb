class AddLinkKarmaToBots < ActiveRecord::Migration[6.0]
  def change
    add_column :bots, :link_karma, :integer
  end
end
