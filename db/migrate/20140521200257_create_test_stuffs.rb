class CreateTestStuffs < ActiveRecord::Migration
  def change
    create_table :test_stuffs do |t|
      t.float :duration

      t.timestamps
    end
  end
end
