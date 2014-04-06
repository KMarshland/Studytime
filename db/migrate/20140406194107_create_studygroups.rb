class CreateStudygroups < ActiveRecord::Migration
  def change
    create_table :studygroups do |t|
      t.string :name
      t.string :description
      t.string :location
      t.string :time

      t.timestamps
    end
  end
end
