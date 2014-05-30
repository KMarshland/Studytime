class AddLatLonToStudygroup < ActiveRecord::Migration
  def change
    add_column :studygroups, :latitude, :float
    add_column :studygroups, :longitude, :float
  end
end
