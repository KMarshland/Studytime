class AddHostRefToStudygroup < ActiveRecord::Migration
  def change
    add_reference :studygroups, :host, index: true
  end
end
