class UsersFixDescriptionTypo < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :desicript, :description
  end
end
