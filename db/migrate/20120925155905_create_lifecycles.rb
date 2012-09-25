class CreateLifecycles < ActiveRecord::Migration
  def change
    create_table :lifecycles do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
