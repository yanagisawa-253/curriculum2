class AddAdminToCustmer < ActiveRecord::Migration[5.2]
  def change
    add_column :custmers, :admin, :boolean, defeault: false
  end
end
