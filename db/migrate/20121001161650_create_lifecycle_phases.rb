class CreateLifecyclePhases < ActiveRecord::Migration
  def change
    create_table :lifecycle_phases do |t|
      t.string :name
      t.text :description
      t.integer :sequence
      t.integer :lifecycle_id

      t.timestamps
    end
  end
end
