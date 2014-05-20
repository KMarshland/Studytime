class AddAdminToUser < ActiveRecord::Migration
  def up
    add_column :users, :is_admin, :boolean
  end
end
