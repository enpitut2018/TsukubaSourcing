class UpdateUsertable < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :desicript, :string
    add_column :users, :job_id, :integer 
  end
end
