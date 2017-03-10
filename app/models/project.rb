class Project < ApplicationRecord
  has_many :milestones
  validates :name , presence: true, uniqueness: true
  validates :person_responsible, presence: true
  validates :start, presence: true
  validates :planned_termination_date, presence: true


end
