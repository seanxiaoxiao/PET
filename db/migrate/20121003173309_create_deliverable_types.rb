class CreateDeliverableTypes < ActiveRecord::Migration
  def change
    create_table :deliverable_types do |t|
      t.string :name
      t.integer :unit_of_measure_id

      t.timestamps
    end
  end
end
