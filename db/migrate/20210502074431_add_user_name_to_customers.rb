class AddUserNameToCustomers < ActiveRecord::Migration[5.2]
  def change
    add_column :customers, :User_name, :string
  end
end
