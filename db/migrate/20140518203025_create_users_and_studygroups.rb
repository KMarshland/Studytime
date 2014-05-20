class CreateUsersAndStudygroupsTable < ActiveRecord::Migration
  def self.up
    create_table :studygroups_users do |t|
      t.integer :studygroup_id
      t.integer :user_id
    end
  end

  def self.down
    drop_table :studygroups_users
  end
end
