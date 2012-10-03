class CreateDeliverables < ActiveRecord::Migration
  def change
    create_table :deliverables do |t|
      t.string :name
      t.text :description
      t.integer :deliverable_type_id
      t.integer :complexity_id

      t.timestamps
    end
  end
end
