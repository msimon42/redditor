class CreateBots < ActiveRecord::Migration[6.0]
  def change
    create_table :bots do |t|
      t.string :username
      t.string :password
      t.string :recovery_email

      t.timestamps
    end
  end
end
