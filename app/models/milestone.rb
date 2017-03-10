class Milestone < ApplicationRecord
  belongs_to :project
  validates :name, presence: true, uniqueness: true
  validates :person_responsible, presence: true
  validates :completed, inclusion: { in: [ true, false ] }
  validates :project_id, presence: true
end
