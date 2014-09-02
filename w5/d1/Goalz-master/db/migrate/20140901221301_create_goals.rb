class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.string :body, null: false
      t.boolean :secret, null: false, :default  => true
      t.integer :user_id, null: false
      t.boolean :complete, null: false, :default  => false

      t.timestamps
    end
  end
end
