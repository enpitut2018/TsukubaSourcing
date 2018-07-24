class CreateJobs < ActiveRecord::Migration[5.2]
  def change
    create_table :jobs do |t|
      t.string :title
      t.integer :user_id
      t.string :description

      t.timestamps
    end
  end
end
