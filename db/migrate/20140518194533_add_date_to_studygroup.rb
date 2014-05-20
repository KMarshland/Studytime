class AddDateToStudygroup < ActiveRecord::Migration
  def up
    add_column :studygroups, :todaysDate, :date
  end
end
