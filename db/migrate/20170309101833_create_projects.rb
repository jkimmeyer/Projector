class CreateProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :projects do |t|
      t.string :name
      t.string :person_responsible
      t.text :description
      t.date :project_start_date
      t.date :planned_termination_date

      t.timestamps
    end
  end
end
