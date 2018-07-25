class CreateJobcomments < ActiveRecord::Migration[5.2]
  def change
    create_table :jobcomments do |t|
      t.text :comment
      t.integer :star
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
