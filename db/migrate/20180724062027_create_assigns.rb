class CreateAssigns < ActiveRecord::Migration[5.2]
  def change
    create_table :assigns do |t|
      t.integer :job_id
      t.integer :user_id
      t.string :status

      t.timestamps
    end
  end
end
