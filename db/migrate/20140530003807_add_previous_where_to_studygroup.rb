class AddPreviousWhereToStudygroup < ActiveRecord::Migration
  def change
    add_column :studygroups, :previousWhere, :string
  end
end
