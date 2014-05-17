class AddDaysToStudygroup < ActiveRecord::Migration
  def up
    add_column :studygroups, :daysFromNow, :integer
  end
end
