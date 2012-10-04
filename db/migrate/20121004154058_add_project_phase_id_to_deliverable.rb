class AddProjectPhaseIdToDeliverable < ActiveRecord::Migration
  def change
    change_table :deliverables do |t|
      t.integer :project_phase_id
    end
  end
end
