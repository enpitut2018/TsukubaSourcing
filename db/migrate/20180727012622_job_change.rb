class JobChange < ActiveRecord::Migration[5.2]
  def change
    add_column :jobs, :reward, :integer
    add_column :jobs, :time, :time
    add_column :jobs, :limit_date, :datetime
    add_column :jobs, :limit_time, :time
  end
end
