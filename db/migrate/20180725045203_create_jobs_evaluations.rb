class CreateJobsEvaluations < ActiveRecord::Migration[5.2]
  def change
    create_table :jobs_evaluations do |t|
      t.text :comment
      t.integer :star
      t.integer :user_id

      t.timestamps
    end
  end
end
