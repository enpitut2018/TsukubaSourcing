class CreateJobcomments < ActiveRecord::Migration[5.2]
  def change
    create_table :jobcomments do |t|
      t.text :comment
      t.integer :star
      t.integer :user_id

      t.timestamps
    end
  end
end
