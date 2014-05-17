class CreateStudygroups < ActiveRecord::Migration
  def change
    drop_table :studygroups
    create_table :studygroups do |t|
      t.time :when
      t.string :where
      t.integer :daysFromNow
      t.string :websiteLink

      t.timestamps
    end
  end
end
