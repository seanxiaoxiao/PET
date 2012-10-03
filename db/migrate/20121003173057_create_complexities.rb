class CreateComplexities < ActiveRecord::Migration
  def change
    create_table :complexities do |t|
      t.string :name

      t.timestamps
    end
  end
end
