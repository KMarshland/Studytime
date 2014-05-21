class AddDurationToStudygroups < ActiveRecord::Migration
  def change
    add_column :studygroups, :duration, :float
  end
end
