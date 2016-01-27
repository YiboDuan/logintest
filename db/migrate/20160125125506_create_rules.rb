class CreateRules < ActiveRecord::Migration
  def change
    create_table :rules do |t|
      t.string :cidr
      t.integer :permission

      t.timestamps null: false
    end
  end
end
