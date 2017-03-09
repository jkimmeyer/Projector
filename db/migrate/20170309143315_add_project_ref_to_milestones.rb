class AddProjectRefToMilestones < ActiveRecord::Migration[5.0]
  def change
    add_reference :milestones, :project, foreign_key: true
  end
end
