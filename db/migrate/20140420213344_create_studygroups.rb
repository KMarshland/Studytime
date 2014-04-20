class CreateStudygroups < ActiveRecord::Migration
  def change
    drop_table :studygroups
    create_table :studygroups do |t|
      t.string :host
      t.string :streetNumber
      t.string :streetName
      t.string :city
      t.string :state
      t.integer :zipcode
      t.datetime :when

      t.timestamps
    end
  end
end
