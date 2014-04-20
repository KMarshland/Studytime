class CreateStudygroups < ActiveRecord::Migration
  def change
    create_table :studygroups do |t|
      t.int :hour
      t.int :minute
      t.boolean :am
      t.string :host
      t.int :daysFromNow
      t.string :streetNumber
      t.string :streetName
      t.string :city
      t.string :state
      t.int :zipcode

      t.timestamps
    end
  end
end
