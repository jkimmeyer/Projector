class CreateMilestones < ActiveRecord::Migration[5.0]

  def change
    create_table :milestones do |t|
      t.string :name
      t.string :person_responsible
      t.text :description
      t.boolean :completed

      t.timestamps
    end
  end
end
