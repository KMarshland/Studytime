class AddAdressToStudygroup < ActiveRecord::Migration

  def up
   # add_column :studygroups, :street_number, :integer
   # add_column :studygroups, :street_name, :string
   # add_column :studygroups, :city, :string
   # add_column :studygroups, :state, :string
   # add_column :studygroups, :zip_code, :integer
  end

  def down
    #remove_column :studygroups, :street_number
    #remove_column :studygroups, :street_name
    #remove_column :studygroups, :city
    #remove_column :studygroups, :state
    #remove_column :studygroups, :zip_code
  end

end
