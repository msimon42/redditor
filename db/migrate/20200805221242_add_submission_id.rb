class AddSubmissionId < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :submission_id, :string
    add_column :comments, :submission_id, :string
  end
end
