class RenameUserNameColumnToCustomers < ActiveRecord::Migration[5.2]
  def change
    rename_column :customers, :User_name, :user_name
  end
end
