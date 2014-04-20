class RemoveLocationFromStudygroups < ActiveRecord::Migration
  def up
    remove_column :studygroups, :location
  end

  def down
    add_column :studygroups, :location, :string
  end
end
