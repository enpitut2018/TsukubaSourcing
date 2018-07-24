class Renamedescription < ActiveRecord::Migration[5.2]
  def change
    rename_column :jobs, :description, :description
  end
end
