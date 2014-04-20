class AddTimestuffToStudygroup < ActiveRecord::Migration

  def up
    add_column :studygroups, :day, :integer
    add_column :studygroups, :month, :integer
    add_column :studygroups, :year, :integer
    add_column :studygroups, :hour, :integer
    add_column :studygroups, :minute, :integer
  end

end
