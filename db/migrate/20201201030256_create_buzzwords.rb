class CreateBuzzwords < ActiveRecord::Migration[6.0]
  def change
    create_table :buzzwords do |t|
      t.string :word
      t.float :value

      t.timestamps
    end
  end
end
